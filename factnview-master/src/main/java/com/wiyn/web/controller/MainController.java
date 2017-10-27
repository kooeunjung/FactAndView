package com.wiyn.web.controller;

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
import com.wiyn.web.dao.MemberDao;
import com.wiyn.web.dao.NoticeBoardDao;
import com.wiyn.web.dao.RequestBoardDao;
import com.wiyn.web.dao.SiteBoardDao;
import com.wiyn.web.dao.SiteBoardLikeDao;
import com.wiyn.web.dao.SiteCommentDao;
import com.wiyn.web.entity.FreeBoard;
import com.wiyn.web.entity.NoticeBoard;
import com.wiyn.web.entity.RequestBoard;
import com.wiyn.web.entity.SiteBoard;
import com.wiyn.web.entity.Tag;

@Controller
@RequestMapping("/main/*")
public class MainController {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private SiteBoardDao siteBoardDao;

	@Autowired
	private NoticeBoardDao noticBoardDao;

	@Autowired
	private RequestBoardDao requestBoardDao;

	@Autowired
	private SiteBoardLikeDao siteBoardLikeDao;

	
// ----------------index-------------------
	@RequestMapping("index")
	public String index(String id, @RequestParam(value = "p", defaultValue = "1") Integer page,
			@RequestParam(value = "q", defaultValue = "") String query,
			Model model) {
		List<SiteBoard> sitelist = sqlSession.getMapper(SiteBoardDao.class).getList(page, query);
		List<SiteBoard> sitelistlike = sqlSession.getMapper(SiteBoardDao.class).getListLike(page, query);
		List<SiteBoard> sitelistcomment = sqlSession.getMapper(SiteBoardDao.class).getListComment(page, query);

		int size = sqlSession.getMapper(SiteBoardDao.class).getSize();
		String last = sqlSession.getMapper(SiteBoardDao.class).lastId();
		SiteBoard board = sqlSession.getMapper(SiteBoardDao.class).getBoard(id);
		SiteBoard prev = sqlSession.getMapper(SiteBoardDao.class).getPrev(id);
		SiteBoard next = sqlSession.getMapper(SiteBoardDao.class).getNext(id);

//		String a = sqlSession.getMapper(SmallCategoryDao.class).getFirstHot();
		System.out.println("---------mainPage접속---------");
/*		List<SiteBoard> hot = sqlSession.getMapper(SiteBoardDao.class).getHotSmall(a);

		for (SiteBoard siteBoard : hot) {
			siteBoard.setUserProfile(sqlSession.getMapper(MemberDao.class).get(siteBoard.getMemberId()).getProfile());
			siteBoard.setLikeCount(sqlSession.getMapper(SiteBoardLikeDao.class).getLike(siteBoard.getId()));
		}
		model.addAttribute("hot", hot);

//		String b = sqlSession.getMapper(SmallCategoryDao.class).getSecondHot();
		List<SiteBoard> hot2 = sqlSession.getMapper(SiteBoardDao.class).getHotSmall(b);

		for (SiteBoard siteBoard : hot2) {
			siteBoard.setUserProfile(sqlSession.getMapper(MemberDao.class).get(siteBoard.getMemberId()).getProfile());
			siteBoard.setLikeCount(sqlSession.getMapper(SiteBoardLikeDao.class).getLike(siteBoard.getId()));
		}
		model.addAttribute("hot2", hot2);*/

		List<NoticeBoard> noticelist = sqlSession.getMapper(NoticeBoardDao.class).getList();
		model.addAttribute("noticelist", noticelist);

		model.addAttribute("sitelist", sitelist);
		model.addAttribute("sitelistlike", sitelistlike);
		model.addAttribute("sitelistcomment", sitelistcomment);

		model.addAttribute("size", size);
		model.addAttribute("last", last);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("board", board);

		SiteBoard random = sqlSession.getMapper(SiteBoardDao.class).getRandom();
		int likeCount = siteBoardLikeDao.getLike(id);

/*		String bName = siteBoardDao.getBName(random.getId());
		String sName = siteBoardDao.getSName(random.getId());
		List<Tag> tName = siteBoardDao.getTName(random.getId());*/

		model.addAttribute("random", random);
		model.addAttribute("l", likeCount);
		/*s*/
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
/*
		List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();

		for (BigCategory bigCategory : bcbList) {
			List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
			bigCategory.setSmallCategory(small);
		}
		model.addAttribute("bcbList", bcbList);*/

		return "main.index";

	}

	
	
	
	
// ----------------index 2-------------------
	@RequestMapping("index2")
	public String index2(String id, @RequestParam(value = "p", defaultValue = "1") Integer page,
			@RequestParam(value = "q", defaultValue = "") String query,
			@RequestParam(value = "bigCa", defaultValue = "") String bigCategoryId,
			@RequestParam(value = "smallCa", defaultValue = "") String smallCategoryId, Model model) {
		List<SiteBoard> sitelist = sqlSession.getMapper(SiteBoardDao.class).getList(page, query);
		List<SiteBoard> sitelistlike = sqlSession.getMapper(SiteBoardDao.class).getListLike(page, query);
		List<SiteBoard> sitelistcomment = sqlSession.getMapper(SiteBoardDao.class).getListComment(page, query
				);

		int size = sqlSession.getMapper(SiteBoardDao.class).getSize();
		String last = sqlSession.getMapper(SiteBoardDao.class).lastId();
		SiteBoard board = sqlSession.getMapper(SiteBoardDao.class).getBoard(id);
		SiteBoard prev = sqlSession.getMapper(SiteBoardDao.class).getPrev(id);
		SiteBoard next = sqlSession.getMapper(SiteBoardDao.class).getNext(id);

		List<NoticeBoard> noticelist = sqlSession.getMapper(NoticeBoardDao.class).getList();
		model.addAttribute("noticelist", noticelist);

		model.addAttribute("sitelist", sitelist);
		model.addAttribute("sitelistlike", sitelistlike);
		model.addAttribute("sitelistcomment", sitelistcomment);

		model.addAttribute("size", size);
		model.addAttribute("last", last);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("board", board);

		SiteBoard random = sqlSession.getMapper(SiteBoardDao.class).getRandom();
		int likeCount = siteBoardLikeDao.getLike(id);

		String bName = siteBoardDao.getBName(random.getId());
		String sName = siteBoardDao.getSName(random.getId());
		List<Tag> tName = siteBoardDao.getTName(random.getId());

		System.out.println(bName);

		model.addAttribute("random", random);
		model.addAttribute("l", likeCount);
		model.addAttribute("b", bName);
		model.addAttribute("s", sName);
		model.addAttribute("t", tName);
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

	/*	List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();

		for (BigCategory bigCategory : bcbList) {
			List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
			bigCategory.setSmallCategory(small);
		}
		model.addAttribute("bcbList", bcbList);*/

		return "main.index2";
	}

// ---------------- index 3 -------------------
	@RequestMapping("index3")
	public String index3(String id, @RequestParam(value = "p", defaultValue = "1") Integer page,
			@RequestParam(value = "q", defaultValue = "") String query,
			@RequestParam(value = "bigCa", defaultValue = "") String bigCategoryId,
			@RequestParam(value = "smallCa", defaultValue = "") String smallCategoryId, Model model) {
		List<SiteBoard> sitelist = sqlSession.getMapper(SiteBoardDao.class).getList(page, query);
		List<SiteBoard> sitelistlike = sqlSession.getMapper(SiteBoardDao.class).getListLike(page, query);
		List<SiteBoard> sitelistcomment = sqlSession.getMapper(SiteBoardDao.class).getListComment(page, query
				);

		int size = sqlSession.getMapper(SiteBoardDao.class).getSize();
		String last = sqlSession.getMapper(SiteBoardDao.class).lastId();
		SiteBoard board = sqlSession.getMapper(SiteBoardDao.class).getBoard(id);
		SiteBoard prev = sqlSession.getMapper(SiteBoardDao.class).getPrev(id);
		SiteBoard next = sqlSession.getMapper(SiteBoardDao.class).getNext(id);

		List<NoticeBoard> noticelist = sqlSession.getMapper(NoticeBoardDao.class).getList();
		model.addAttribute("noticelist", noticelist);

		model.addAttribute("sitelist", sitelist);
		model.addAttribute("sitelistlike", sitelistlike);
		model.addAttribute("sitelistcomment", sitelistcomment);

		model.addAttribute("size", size);
		model.addAttribute("last", last);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("board", board);

		SiteBoard random = sqlSession.getMapper(SiteBoardDao.class).getRandom();
		int likeCount = siteBoardLikeDao.getLike(id);

		String bName = siteBoardDao.getBName(random.getId());
		String sName = siteBoardDao.getSName(random.getId());
		List<Tag> tName = siteBoardDao.getTName(random.getId());

		model.addAttribute("random", random);
		model.addAttribute("l", likeCount);
		model.addAttribute("b", bName);
		model.addAttribute("s", sName);
		model.addAttribute("t", tName);

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

		/*List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();

		for (BigCategory bigCategory : bcbList) {
			List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
			bigCategory.setSmallCategory(small);
		}
		model.addAttribute("bcbList", bcbList);*/

		return "main.index3";
	}

// ---------------- reg-index -------------------
	@RequestMapping(value = "reg-index", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String regindex(RequestBoard requestBoard, @RequestParam(value = "title") String title,
			@RequestParam(value = "content") String content, @RequestParam(value = "memberId") String memberId) {

		System.out.print(title + content + memberId);

		requestBoard.setTitle(title);
		requestBoard.setContent(content);
		requestBoard.setMemberId(memberId);

		requestBoardDao.add(requestBoard);

		/* return "redirect:request-detail?c=" + requestBoard.getId(); */
		return "redirect:index#location123";

	}

}
