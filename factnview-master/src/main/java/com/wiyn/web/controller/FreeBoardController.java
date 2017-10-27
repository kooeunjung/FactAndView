package com.wiyn.web.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.wiyn.web.dao.FreeBoardDao;
import com.wiyn.web.dao.FreeBoardFileDao;
import com.wiyn.web.dao.FreeCommentDao;
import com.wiyn.web.dao.RequestBoardDao;
import com.wiyn.web.dao.SiteBoardDao;
import com.wiyn.web.entity.FreeBoard;
import com.wiyn.web.entity.FreeComment;
import com.wiyn.web.entity.FreeFile;
import com.wiyn.web.entity.RequestBoard;
import com.wiyn.web.entity.SiteBoard;

@Controller
@RequestMapping("/freeboard/*")
public class FreeBoardController {

	@Autowired
	private FreeBoardDao freeBoardDao;
	
	@Autowired
	private FreeBoardFileDao freeBoardFileDao;

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ServletContext context;

	//freeboard - > 게시판 리스트
	@RequestMapping("freeboard")
	public String request(@RequestParam(value="p", defaultValue="1")Integer page,
			Model model,String commentCount) {		
		
	/*	List<FreeBoard> list = sqlSession.getMapper(FreeBoardDao.class).getList();
		for (FreeBoard freeBoard : list) {
			freeBoard.setFreeComment(sqlSession.getMapper(FreeCommentDao.class).getList(freeBoard.getId(), 2));
			
		}*/
		
		List<FreeFile> fileList = sqlSession.getMapper(FreeBoardFileDao.class).getList();
		List<FreeBoard> pageList = sqlSession.getMapper(FreeBoardDao.class).getList(page);
		int paging = sqlSession.getMapper(FreeBoardDao.class).getPage();
		
		model.addAttribute("pageList", pageList);
		model.addAttribute("paging", paging);
	/*	model.addAttribute("list", list);*/
		model.addAttribute("freeboard", "freeboard");
		model.addAttribute("fileList", fileList);
		
		System.out.println("FactBoard"+paging);
		
		
		
		/*List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		for (BigCategory bigCategory : bcbList) {
			List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
			bigCategory.setSmallCategory(small);
		}
		model.addAttribute("bcbList", bcbList);*/
		
		return "freeboard.freeboard";
	}

	
	
	//free-reg 게시판 등록 페이지
	@RequestMapping("free-reg")
	public String free(
			@RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
            @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
            Model model) {
		
		/*List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		for (BigCategory bigCategory : bcbList) {
			List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
			bigCategory.setSmallCategory(small);
		}
		model.addAttribute("bcbList", bcbList);*/
		return "freeboard.free-reg";
	}
	
	
	
	
	// reg 등록하기
	@RequestMapping(value = "reg", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String free(
			FreeBoard freeboard, 
			FreeFile freeFile,
			@RequestParam(value="file", defaultValue="null") MultipartFile file,
			
			@RequestParam(value = "title") String title,
			@RequestParam(value = "content") String content, 
			@RequestParam(value = "contentSrc") String contentSrc,
			@RequestParam(value = "memberId") String memberId
			)throws IOException {

		String boardName="free";
		freeboard.setTitle(title);
		freeboard.setContent(content);
		freeboard.setContentSrc(contentSrc);
		freeboard.setMemberId(memberId);
		freeboard.setBoardName(boardName);
		
		freeBoardDao.add(freeboard);

		if(!file.isEmpty()){
			String path = context.getRealPath("/resource/upload");
			
			/*String path = "WiynPrj\\resources\\upload";*/
			
			File d = new File(path);
			if(!d.exists())//��ΰ� �������� �ʴ´ٸ�
				d.mkdir();
		
			String originalFilename = file.getOriginalFilename(); // fileName.jpg
		    String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
		    String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
			
		    String rename = onlyFileName + "_" + getCurrentDayTime() + extension; // fileName_20150721-14-07-50.jpg
		    String fullPath = path + "\\" + rename;
		    
		    if (!file.isEmpty()) {
		        try {
		            byte[] bytes = file.getBytes();
		            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
		            stream.write(bytes);
		            stream.close();
		            //model.addAttribute("resultMsg", "������ ���ε� ����!");
		            System.out.println("���ε� ����");
		        } catch (Exception e) {
		            //model.addAttribute("resultMsg", "������ ���ε��ϴ� ���� �����߽��ϴ�.");
		        	System.out.println("���ε� ����");
		        }
		    } else {
		        //model.addAttribute("resultMsg", "���ε��� ������ �������ֽñ� �ٶ��ϴ�.");
		    	System.out.println("���ε� ���� x");
		    }
		    
		    fullPath = "\\resource\\upload\\";
		    
		    freeFile.setName(rename);
			freeFile.setFreeBoardId(freeboard.getId());
			freeFile.setSrc(fullPath);
			
			freeBoardFileDao.add(freeFile);
		    
		    System.out.println(fullPath);
		}
		
		
		return "redirect:free-detail?c=" + freeboard.getId();

	}
	
	
	public String getCurrentDayTime(){
	    long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
	    return dayTime.format(new Date(time));
	}
	
	//게시판 글 눌렀을 때 디테일페이지
	@RequestMapping("free-detail")
	public String freeDetail(@RequestParam("c") String id, 
			@RequestParam(value = "p", defaultValue = "1") Integer page,
			@RequestParam(value = "q", defaultValue = "") String query,
			Model model) {

		FreeBoard freeboard = new FreeBoard();

		freeboard = sqlSession.getMapper(FreeBoardDao.class).get(id);
		freeboard.setFreeComment(sqlSession.getMapper(FreeCommentDao.class).getList(id, page));
		
		FreeFile freeFile = new FreeFile();
		freeFile = sqlSession.getMapper(FreeBoardFileDao.class).get(id);

		int size = sqlSession.getMapper(FreeCommentDao.class).getSize(id);

		model.addAttribute("page", page);
		model.addAttribute("size", size);
		model.addAttribute("n", freeboard);
		model.addAttribute("file", freeFile);

		freeboard.getTitle();
		freeBoardDao.updateHit(id);
		
		/*--------------------------리스트보여주기-----------------------------------*/
		List<SiteBoard> sitelist = sqlSession.getMapper(SiteBoardDao.class).getListRalative(page,id); // getList
		
		SiteBoard board = sqlSession.getMapper(SiteBoardDao.class).getBoard(id); 
		model.addAttribute("sitelist", sitelist);
		model.addAttribute("board", board);

		/*-------------*/

		int listPerFive = (page - 1) / 5;
		int checkLast = (listPerFive * 5) + 5;

		model.addAttribute("listPerFive", listPerFive);
		model.addAttribute("checkLast", checkLast);

		/*-------------*/
		int cnt = sqlSession.getMapper(SiteBoardDao.class).count();
		if (cnt % 10 == 0)
			cnt = cnt / 10;
		else
			cnt = (cnt / 10) + 1;

		if (checkLast > cnt)
			checkLast = cnt;
		
		model.addAttribute("cnt", cnt);
				
		return "freeboard.free-detail";
	}

	//지우기
	@RequestMapping(value = "free-del", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String freeDel(FreeBoard freeboard,

			@RequestParam(value = "id") String id) {

		System.out.println(id);
		freeBoardDao.delete(id);

		return "redirect:freeboard";

	}
	//수정
	@RequestMapping("free-edit")
	public String freeEditGet(@RequestParam("c") String id,
			Model model) {


		model.addAttribute("n", freeBoardDao.get(id));
		
	/*	List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
		
		for (BigCategory bigCategory : bcbList) {
			List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
			bigCategory.setSmallCategory(small);
		}
		model.addAttribute("bcbList", bcbList);*/

		return "freeboard.free-edit";
	}

	
	@RequestMapping(value = "free-details", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String freeEditPost(Model model, FreeBoard freeboard,
			String title, 
			 String content,
			String contentSrc) {

		/*freeboard = sqlSession.getMapper(FreeBoardDao.class).get(id);*/

		model.addAttribute("n", freeboard);

		System.out.println(title);
		System.out.println(content);
		
		freeboard.setTitle(title);
		freeboard.setContent(content);
		freeboard.setContentSrc(contentSrc);

		freeBoardDao.update(freeboard);

		return "redirect:free-detail?c="+freeboard.getId();
	}
	
	@RequestMapping(value="ListPage", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String ListPage(Model model,
			@RequestParam(value="page")String page,
			@RequestParam(value="id")String id){
		

		List<FreeBoard> freeboard = sqlSession.getMapper(FreeBoardDao.class).getList(id, Integer.parseInt(page));
	
		
		Gson gson = new Gson();
		String json = gson.toJson(freeboard);
		
		return json;
	}

	
}
