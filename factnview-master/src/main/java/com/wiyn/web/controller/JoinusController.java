package com.wiyn.web.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.wiyn.web.dao.MemberDao;
import com.wiyn.web.entity.Member;

@Controller
@RequestMapping("/joinus/*")
public class JoinusController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private ServletContext context;
	
	
//------------가입시키기
	@RequestMapping(value="singIn", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String singIn(
			@RequestParam(value="email1")String email, 
			@RequestParam(value="pass")String pwd
			) {

		System.out.println(email+pwd);
		System.out.println(memberDao);
		
		int result = memberDao.add(email, pwd);
		
		System.out.println(result);
		
		if(result > 0) memberDao.addRole(email, "ROLE_USER");
		
		return "redirect:../main/index";
	}
	

//------------가입되어있니?
		@RequestMapping("isSingIn")
		@ResponseBody
		public String isSingIn(
				@RequestParam(value="email1")String email){
			
			int result = memberDao.isExistEmail(email);
			
			return Integer.toString(result);
		}

		@RequestMapping("callback")
		public String callback(){
			System.out.println("callback");
			return "joinus.callback";
		}
//------------가입허가해줄게	
		/*@RequestMapping("singin")
		public String singin(
				@RequestParam(value="bigCa",defaultValue="")String bigCategoryId,
	            @RequestParam(value="smallCa",defaultValue="")String smallCategoryId,
	            Model model){
			
			List<BigCategory> bcbList = sqlSession.getMapper(BigCategoryDao.class).getList();
			
			for (BigCategory bigCategory : bcbList) {
				List<SmallCategory> small = sqlSession.getMapper(SmallCategoryDao.class).getListWithBC(bigCategory.getId());
				bigCategory.setSmallCategory(small);
			}
			model.addAttribute("bcbList", bcbList);
			return "joinus.singin";		
		}*/
	
//-----------------마이페이지
	@RequestMapping("mypage")
	public String mypage(Principal principal){
		
		String memberId = principal.getName();
		
		System.out.println("joinusController.java:" + memberId);
		
		return "redirect:../main/index";	
	}
	
//로그인해라
	@RequestMapping("login")
	@ResponseBody
	public String login(
			@RequestParam(value="j_username")String j_username,
			@RequestParam(value="j_password")String j_password){
		
		System.out.println(j_username);
		System.out.println(j_password);
		int result = memberDao.isLogin(j_username, j_password);
		return Integer.toString(result);
	}

	@RequestMapping(value="naver", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String naver(
			@RequestParam(value="email")String email
			
			) {
		System.out.println(email);
		return "joinus.login";
	}
	
	
	@RequestMapping("getUser")
	@ResponseBody
	public String getUser(
			@RequestParam(value="email")String email){

		Member member = memberDao.get(email);
		String gson =  new Gson().toJson(member);
		
		return gson;
	}
	
	@RequestMapping(value="profileUpdate", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String profileUpdate(
			@RequestParam(value="file", defaultValue="null") MultipartFile file,
			@RequestParam(value="email")String email,
			@RequestParam(value="introduction")String introduction){
		
		int result = 0 ;
		if(!file.isEmpty()){
			String path = context.getRealPath("/resource/profile");
			
			File d = new File(path);
			if(!d.exists())
				d.mkdir();
		
			String originalFilename = file.getOriginalFilename(); // fileName.jpg
		   
			String fullPath = path + "\\" + originalFilename;
		    if (!file.isEmpty()) {
		        try {
		            byte[] bytes = file.getBytes();
		            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
		            stream.write(bytes);
		            stream.close();
		            System.out.println("���ε� ����");
		        } catch (Exception e) {
		        	System.out.println(e);
		        	System.out.println("���ε� ����");
		        }
		    } else {
		    	System.out.println("���ε� ���� x");
		    }

		    result = memberDao.update(email, originalFilename,introduction);
		   // result = memberDao.update(email, originalFilename,introduction);
		    		    
		}

		return Integer.toString(result);
	}
	
	@RequestMapping(value="profileUpdate1", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String profileUpdate1(
			@RequestParam(value="email")String email,
			@RequestParam(value="introduction")String introduction){
		
		int result = 0 ;
		
		Member member = memberDao.get(email);
		
		String originalFilename = member.getProfile();

		String nickname;
		result = memberDao.update(email, originalFilename,introduction);
		    		    
		return Integer.toString(result);
	}
	
	
	
}
