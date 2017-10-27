package com.wiyn.web.controller;

import java.io.File;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.wiyn.web.dao.FreeBoardDao;
import com.wiyn.web.dao.FreeBoardFileDao;
import com.wiyn.web.dao.FreeCommentDao;
import com.wiyn.web.dao.SiteBoardDao;
import com.wiyn.web.dao.SiteBoardLikeDao;
import com.wiyn.web.dao.SiteCommentDao;
import com.wiyn.web.dao.TagDao;
import com.wiyn.web.entity.FreeBoard;
import com.wiyn.web.entity.FreeFile;
import com.wiyn.web.entity.SiteBoard;
import com.wiyn.web.entity.SiteBoardLike;
import com.wiyn.web.entity.SiteComment;
import com.wiyn.web.entity.Tag;

@Controller
@RequestMapping("/siteboard/*")
public class SiteBoardController {

	@Autowired
	SqlSession sqlSession;
	@Autowired
	private SiteBoardDao siteBoardDao;
	@Autowired
	private SiteCommentDao siteCommentDao;
	@Autowired
	private SiteBoardLikeDao siteBoardLikeDao;
	@Autowired
	private FreeBoardDao freeBoardDao;

/////////////////// siteboard 리스트 출력화면/////////////////////////
	@RequestMapping("siteboard")
	public String siteboard(String id,
			@RequestParam(value = "p", defaultValue = "1") Integer page,
			@RequestParam(value="p", defaultValue="1")Integer page2,
			@RequestParam(value = "q", defaultValue = "") String query,
			Model model) {
		
		/*-------------------------------fact 리스트--------------------------------------*/	
		
		List<FreeBoard> pageList = sqlSession.getMapper(FreeBoardDao.class).getList(page2);
		int paging = sqlSession.getMapper(FreeBoardDao.class).getPage();
		
		model.addAttribute("pageList", pageList);
		model.addAttribute("paging", paging);
		model.addAttribute("freeboard", "freeboard");
		
		System.out.println("----------------View 페이지에 FactBoard 리스트 뽑기 -------------");

		
			/*-------------------------------view 리스트--------------------------------------*/	
		List<SiteBoard> sitelist = sqlSession.getMapper(SiteBoardDao.class).getList(page, query); // getList
		int size = sqlSession.getMapper(SiteBoardDao.class).getSize(); // getSize()
		String last = sqlSession.getMapper(SiteBoardDao.class).lastId(); // getId()
		SiteBoard board = sqlSession.getMapper(SiteBoardDao.class).getBoard(id); // getBoard(id)
																					// 메소드
		model.addAttribute("sitelist", sitelist);
		model.addAttribute("size", size);
		model.addAttribute("last", last);
		model.addAttribute("board", board);
/*		model.addAttribute("countcomment", countcomment);*/

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
		
				
	    SiteBoard sitenews = sqlSession.getMapper(SiteBoardDao.class).getNewsc();
		SiteBoard sitenewsL = sqlSession.getMapper(SiteBoardDao.class).getNewsL();
		SiteBoard sitenewsH = sqlSession.getMapper(SiteBoardDao.class).getNewsH();

		model.addAttribute("sitenew", sitenews);
		model.addAttribute("sitenewL", sitenewsL);
		model.addAttribute("sitenewH", sitenewsH);

		return "siteboard.siteboard";
	}

/////////////////// siteboard factId값 받아서 View 쓰러 가기!/////////////////////////
	@RequestMapping("site-reg")
	public String siteReg(@RequestParam("c") String id,
			Model model) {
		
		FreeBoard freeboard = new FreeBoard();
		freeboard = sqlSession.getMapper(FreeBoardDao.class).get(id);
		
		model.addAttribute("n", freeboard);
		
		freeboard.getTitle();
			
		System.out.println("fact "+ id +"번에 대한 view 작성 란");
		
		return "siteboard.site-reg";
	}	
	

/////////////////// siteboard factId값 받아서 View 씀 가기!/////////////////////////
	@RequestMapping(value = "reg", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String site(SiteBoard siteBoard,
			@RequestParam(value = "title") String title,
			@RequestParam(value = "content") String content,
			@RequestParam(value = "factBoardId") String factBoardId,
			@RequestParam(value = "factBoardName") String factBoardName,
			@RequestParam(value = "memberId") String memberId) {

		System.out.println(title);
		System.out.println(factBoardId);
		System.out.println(memberId);

		siteBoard.setTitle(title);
		siteBoard.setContent(content);
		siteBoard.setFactBoardId(factBoardId);
		siteBoard.setFactBoardName(factBoardName);
		siteBoard.setMemberId(memberId);
		siteBoardDao.add(siteBoard);

		return "redirect:site-detail?c=" + siteBoard.getId()+"&f="+factBoardId;
	}

	
/////////////////// site-detail  View 확인하기/////////////////////////	
	@RequestMapping(value = "site-detail", produces = "text/plain;charset=UTF-8")
	public String siteDetail(@RequestParam("c") String id,
			@RequestParam("f") String factBoardId,
			@RequestParam(value = "p", defaultValue = "1") Integer page,
			Model model) {
		
		
		FreeBoard freeboard = new FreeBoard();
		freeboard = sqlSession.getMapper(FreeBoardDao.class).get(factBoardId);
		model.addAttribute("f", freeboard);
		freeboard.getTitle();
		
		SiteBoard siteBoard = new SiteBoard();
		siteBoard = sqlSession.getMapper(SiteBoardDao.class).getBoard(id);
		siteBoard.setSiteComments(sqlSession.getMapper(SiteCommentDao.class).getList(id, page));
		model.addAttribute("n", siteBoard);
		
		System.out.println(siteBoard.getMemberId());
		
		int size = sqlSession.getMapper(SiteCommentDao.class).getSize(id);
		int likeCount = siteBoardLikeDao.getLike(id);

		model.addAttribute("l", likeCount);
		model.addAttribute("page", page);
		model.addAttribute("size", size);
		
		siteBoardDao.updateHit(id);

		return "siteboard.site-detail";
	}

	
	@RequestMapping("site-edit")
	public String siteEdit(@RequestParam("c") String id,
			@RequestParam("f") String factBoardId,
			Model model) {

		model.addAttribute("c", siteBoardDao.getBoard(id));
		model.addAttribute("f", freeBoardDao.get(factBoardId));
		
		return "siteboard.site-edit";
	}
	
	

	@RequestMapping(value = "edit", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String siteEdit(SiteBoard siteBoard,
			@RequestParam(value = "title") String title,
			@RequestParam(value = "content") String content,
			@RequestParam("factBoardId") String factBoardId ,
			@RequestParam("id") String id) {
		
		System.out.println("factboardID입니다"+factBoardId);
		
		siteBoardDao.update(siteBoard);
		
		return "redirect:site-detail?c=" + siteBoard.getId()+"&f="+factBoardId;
	}

	
	@RequestMapping(value = "site-delete", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String siteDelete(@RequestParam(value = "id") String id, SiteBoard siteBoard) {

		siteBoardDao.delete(id);

		return "redirect:siteboard.siteboard";
	}
	
	
	
	
	@RequestMapping(value = "site-list", produces = "text/plain;charset=UTF-8")
	public String siteTag(@RequestParam(value = "p", defaultValue = "1") Integer page,
			@RequestParam("query") String query, Model model) {

		List<SiteBoard> list = sqlSession.getMapper(SiteBoardDao.class).getTagLoad(query);

		int cnt = sqlSession.getMapper(SiteBoardDao.class).countquery(query);
		int listPerFive = (page - 1) / 5;
		int checkLast = (listPerFive * 5) + 5;

		if (cnt % 10 == 0)
			cnt = cnt / 10;
		else
			cnt = (cnt / 10) + 1;

		if (checkLast > cnt)
			checkLast = cnt;

		model.addAttribute("query", query);
		model.addAttribute("list", list);

		model.addAttribute("listPerFive", listPerFive);
		model.addAttribute("checkLast", checkLast);
		model.addAttribute("cnt", cnt);

		/*
		 * BigCategory bigCatego =
		 * sqlSession.getMapper(BigCategoryDao.class).getbig(bigCategoryId);
		 * SmallCategory smallCatego =
		 * sqlSession.getMapper(SmallCategoryDao.class).getsmall(bigCategoryId,
		 * smallCategoryId);
		 */
		/*
		 * model.addAttribute("bn", bigCatego); model.addAttribute("sn",
		 * smallCatego);
		 */

		SiteBoard sitenews = sqlSession.getMapper(SiteBoardDao.class).getNewsc();
		SiteBoard sitenewsL = sqlSession.getMapper(SiteBoardDao.class).getNewsL();
		SiteBoard sitenewsH = sqlSession.getMapper(SiteBoardDao.class).getNewsH();

		model.addAttribute("sitenew", sitenews);
		model.addAttribute("sitenewL", sitenewsL);
		model.addAttribute("sitenewH", sitenewsH);

		/*
		 * List<BigCategory> bcbList =
		 * sqlSession.getMapper(BigCategoryDao.class).getList();
		 * 
		 * for (BigCategory bigCategory : bcbList) { List<SmallCategory> small =
		 * sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(
		 * bigCategory.getId()); bigCategory.setSmallCategory(small); }
		 */
		/*
		 * model.addAttribute("bcbList", bcbList);
		 * 
		 * List<SiteBoard> bigList =
		 * sqlSession.getMapper(SiteBoardDao.class).likeBig(bigCategoryId);
		 * 
		 * model.addAttribute("likelist",bigList);
		 */

		return "siteboard.site-list";
	}

	/*
	 * @RequestMapping("site-list") public String siteList( Model model,
	 * SiteBoard siteBoard ){ List<SiteBoard> list =
	 * sqlSession.getMapper(SiteBoardDao.class).getList(page, query);
	 * model.addAttribute("n", siteBoard);
	 * 
	 * return "siteboard.site-list"; }
	 */

	
	@RequestMapping(value = "like", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String siteLike(SiteBoard siteBoard, 
			SiteBoardLike siteBoardLike,
			@RequestParam(value = "siteBoardId") String siteBoardId,
			@RequestParam(value = "factBoardId") String factBoardId,
			@RequestParam(value = "memberId") String memberId) {
		
		siteBoardLike.setSiteBoardId(siteBoardId);
		siteBoardLike.setMemberId(memberId);
		SiteBoard board = sqlSession.getMapper(SiteBoardDao.class).getBoard(siteBoardId);
		
		int exitLike = siteBoardLikeDao.isExitLike(siteBoardId, memberId);

		if (exitLike > 0) {
			siteBoardLikeDao.delete(siteBoardId, memberId);
		} else {
			siteBoardLikeDao.add(siteBoardLike);
		}

		return "redirect:site-detail?c=" + siteBoardId+"&f="+factBoardId;
	}

}

/*
 * @RequestMapping(value="getListWithBC", method=RequestMethod.POST,
 * produces="text/plain;charset=UTF-8")
 * 
 * @ResponseBody public String GetListWithBC(Model model,
 * 
 * @RequestParam(value="bigCategoryId")String bigCategoryId){
 * 
 * System.out.println(bigCategoryId); List<SmallCategory> scList =
 * sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategoryId);
 * model.addAttribute("scList", scList);
 * 
 * Gson gson = new Gson(); String json = gson.toJson(scList);
 * 
 * return json; }
 */




/////////////////// view board HIT 리스트 출력화면/////////////////////////
/*@RequestMapping("siteboardhit")
public String siteboardhit(String id, @RequestParam(value = "p", defaultValue = "1") Integer page,
@RequestParam(value = "q", defaultValue = "") String query, Model model) {


* List<SiteBoard> sitelistcomment =
* sqlSession.getMapper(SiteBoardDao.class).getListComment(page,
* query,bigCategoryId, smallCategoryId);


model.addAttribute("sitelist", sitelistcomment); 

int size = sqlSession.getMapper(SiteBoardDao.class).getSize();
String last = sqlSession.getMapper(SiteBoardDao.class).lastId();
SiteBoard board = sqlSession.getMapper(SiteBoardDao.class).getBoard(id);
model.addAttribute("size", size);
model.addAttribute("last", last);
model.addAttribute("board", board);

int cnt = sqlSession.getMapper(SiteBoardDao.class).count();
int listPerFive = (page - 1) / 5;
int checkLast = (listPerFive * 5) + 5;

if (cnt % 10 == 0)
cnt = cnt / 10;
else
cnt = (cnt / 10) + 1;

if (checkLast > cnt)
checkLast = cnt;

model.addAttribute("listPerFive", listPerFive);
model.addAttribute("checkLast", checkLast);
model.addAttribute("cnt", cnt);

// ------------------------------------------------

* List<BigCategory> bcbList =
* sqlSession.getMapper(BigCategoryDao.class).getList();
* 
* for (BigCategory bigCategory : bcbList) { List<SmallCategory> small =
* sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(
* bigCategory.getId()); bigCategory.setSmallCategory(small); }
* model.addAttribute("bcbList", bcbList);
* 
* 
* BigCategory bigCatego =
* sqlSession.getMapper(BigCategoryDao.class).getbig(bigCategoryId);
* SmallCategory smallCatego =
* sqlSession.getMapper(SmallCategoryDao.class).getsmall(bigCategoryId,
* smallCategoryId); model.addAttribute("bn", bigCatego);
* model.addAttribute("sn", smallCatego);


SiteBoard sitenews = sqlSession.getMapper(SiteBoardDao.class).getNewsc();
SiteBoard sitenewsL = sqlSession.getMapper(SiteBoardDao.class).getNewsL();
SiteBoard sitenewsH = sqlSession.getMapper(SiteBoardDao.class).getNewsH();

model.addAttribute("sitenew", sitenews);
model.addAttribute("sitenewL", sitenewsL);
model.addAttribute("sitenewH", sitenewsH);


* List<SiteBoard> bigList =
* sqlSession.getMapper(SiteBoardDao.class).likeBig(bigCategoryId);
* 
* model.addAttribute("likelist",bigList);


return "siteboard.siteboardhit";
}*/


// siteboardlike 좋아요 눌렀을 때 실행!
/*
* @RequestMapping("siteboardlike") public String siteboardlike(String id,
* 
* @RequestParam(value="p", defaultValue="1")Integer page,
* 
* @RequestParam(value="q", defaultValue="")String query,
* 
* @RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
* 
* @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
* Model model){
* 
* List<SiteBoard> sitelistlike =
* sqlSession.getMapper(SiteBoardDao.class).getListLike(page,
* query,bigCategoryId, smallCategoryId);
* 
* model.addAttribute("sitelist", sitelistlike);
* 
* int size= sqlSession.getMapper(SiteBoardDao.class).getSize(); String
* last= sqlSession.getMapper(SiteBoardDao.class).lastId(); SiteBoard
* board=sqlSession.getMapper(SiteBoardDao.class).getBoard(id);
* model.addAttribute("size", size); model.addAttribute("last", last);
* model.addAttribute("board", board);
* 
* int cnt= sqlSession.getMapper(SiteBoardDao.class).countlike(); int
* listPerFive = (page-1)/5; int checkLast = (listPerFive*5) + 5;
* 
* if(cnt % 10 == 0) cnt = cnt/10; else cnt = (cnt/10)+1;
* 
* if(checkLast > cnt) checkLast = cnt;
* 
* model.addAttribute("listPerFive", listPerFive);
* model.addAttribute("checkLast", checkLast); model.addAttribute("cnt",
* cnt);
* 
* // -------------------------占쏙옙占쏙옙絹占�-----------------------
* List<BigCategory> bcbList =
* sqlSession.getMapper(BigCategoryDao.class).getList();
* 
* for (BigCategory bigCategory : bcbList) { List<SmallCategory> small =
* sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.
* getId()); bigCategory.setSmallCategory(small); }
* model.addAttribute("bcbList", bcbList);
* 
* 
* BigCategory bigCatego =
* sqlSession.getMapper(BigCategoryDao.class).getbig(bigCategoryId);
* SmallCategory smallCatego =
* sqlSession.getMapper(SmallCategoryDao.class).getsmall(bigCategoryId,
* smallCategoryId); model.addAttribute("bn", bigCatego);
* model.addAttribute("sn", smallCatego);
* 
* SiteBoard sitenews=sqlSession.getMapper(SiteBoardDao.class).getNewsc();
* SiteBoard sitenewsL=sqlSession.getMapper(SiteBoardDao.class).getNewsL();
* SiteBoard sitenewsH=sqlSession.getMapper(SiteBoardDao.class).getNewsH();
* 
* model.addAttribute("sitenew", sitenews); model.addAttribute("sitenewL",
* sitenewsL); model.addAttribute("sitenewH", sitenewsH);
* 
* List<SiteBoard> bigList =
* sqlSession.getMapper(SiteBoardDao.class).likeBig(bigCategoryId);
* 
* model.addAttribute("likelist",bigList);
* 
* return "siteboard.siteboardlike"; }
*/

// 사이트 등록
/*
* @RequestMapping("site-reg") public String site(Model model,
* 
* @RequestParam(value="bigCa",defaultValue="")String bigcategoryId,
* 
* @RequestParam(value="smallCa",defaultValue="")String smallcategoryId){
* 
* List<BigCategory> bcList =
* sqlSession.getMapper(BigCategoryDao.class).getList();
* 
* for (BigCategory bigCategory : bcList) {
* bigCategory.setSmallCategory(sqlSession.getMapper(SmallCategoryDao.class)
* .getListWithBC(bigCategory.getId())); }
* 
* model.addAttribute("bcList", bcList);
* 
* 
* List<BigCategory> bcbList =
* sqlSession.getMapper(BigCategoryDao.class).getList();
* 
* for (BigCategory bigCategory : bcbList) { List<SmallCategory> small =
* sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.
* getId()); bigCategory.setSmallCategory(small); }
* model.addAttribute("bcbList", bcbList);
* 
* return "siteboard.site-reg"; }
*/
