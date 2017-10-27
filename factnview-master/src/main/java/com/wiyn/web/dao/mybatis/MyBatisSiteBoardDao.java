package com.wiyn.web.dao.mybatis;

//import문 : 다른 패키지에 속하는 클래스를 사용하기 위해서 import를 사용해서 패키지를 생략하고 클래스만 불러오게한다.
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.wiyn.web.dao.SiteBoardDao;
import com.wiyn.web.entity.SiteBoard;
import com.wiyn.web.entity.Tag;

public class MyBatisSiteBoardDao implements SiteBoardDao{
	
	@Autowired
	private SqlSession sqlSession; 
	//필드선언 -> 부품필드
	//private -> 필드,생성자,메소드 모든 외부 클래스로부터 접근을 막는다. DI공부가필요하다.

	/*	xml 설정에서 ! mybatis 설정해두었음!
	 * 
  	<bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate">
	<constructor-arg index="0" ref="sqlSessionFactory" />
	</bean>
	*
	*/
	
	
	@Override
	public List<SiteBoard> getList(int page,
									String query) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getList(page, query);
	}
	
	@Override
	public List<SiteBoard> getListLike(int page,
										String query) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getListLike(page, query);
	}
	
	@Override
	public List<SiteBoard> getListComment(int page,
											String query
											) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getListComment(page, query);
	}

	
	@Override
	public List<SiteBoard> getListRalative(int page,
												String factBoardId) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getListRalative(page, factBoardId);
	}

/*	--------------------*/
	/*@Override
	public List<SiteBoard> getList(int page,
									String query,
									String bigCategoryId,
									String smallCategoryId) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getList(page, query, bigCategoryId, smallCategoryId);
	}
	
	@Override
	public List<SiteBoard> getListLike(int page,
										String query,
										String bigCategoryId,
										String smallCategoryId) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getListLike(page, query, bigCategoryId, smallCategoryId);
	}
	
	@Override
	public List<SiteBoard> getListComment(int page,
											String query,
											String bigCategoryId,
											String smallCategoryId) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getListComment(page, query, bigCategoryId, smallCategoryId);
	}*/

/*	--------------------*/	
	@Override
	public SiteBoard getBoard(String id) {
		SiteBoardDao siteBoardDao; // 인터페이스를 선언하면 해당 인터페이스를 사용하는 클래스들을 사용할 수 있도록
									// 한다.
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getBoard(id);
	}

	@Override
	public SiteBoard getPrev(String id) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getPrev(id);
	}

	@Override
	public SiteBoard getNext(String id) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getNext(id);
	}
	@Override
	public SiteBoard getRandom() {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getRandom();
	}

/*	--------------------*/	
	@Override
	public SiteBoard getNewsc() {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getNewsc();
	}
	
	@Override
	public SiteBoard getNewsL() {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getNewsL();
	}
	
	@Override
	public SiteBoard getNewsH() {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getNewsH();
	}

/*	--------------------*/	
	// 사이트 추가하기
	@Override
	public int add(SiteBoard siteBoard) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.add(siteBoard);
	}
	
	// 사이트 업뎃하기
	@Override
	public int update(SiteBoard siteBoard) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.update(siteBoard);
	}
	
	//사이트 삭제하기
	@Override
	public int delete(String id) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.delete(id);
	}

/*	--------------------*/	
	@Override
	public String lastId() {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.lastId();
	}
	
	@Override
	public int getSize() {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getSize();
	}

	@Override
	public int updateHit(String id) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.updateHit(id);
	}
	
/*	--------------------*/		

	@Override
	public String getBName(String id) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getBName(id);
	}

	@Override
	public String getSName(String id) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getSName(id);
	}
    
	@Override
	public List<Tag> getTName(String id) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getTName(id);
	}
	
/*	--------------------*/	
	@Override
	public List<SiteBoard> getTagLoad(String query) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getTagLoad(query);
	}
	
/*	--------------------*/	

	@Override
	public int updateCommentCount(String countcomment) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.updateCommentCount(countcomment);
	}
	@Override
	public int count() {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.count();
	}
	@Override
	public int countlike() {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.countlike();
	}
	@Override
	public int countquery(String query) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.countquery(query);
	}

/*	--------------------*/

	@Override
	public List<SiteBoard> getHotSmall(String id) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getHotSmall(id);
	}
	
	@Override
	public List<SiteBoard> likeBig(String bigCategoryId) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.likeBig(bigCategoryId);
	}




	
	/*	@Override
	public List<SiteBoard> getListSpeed(int page, String query, String bigCategoryId, String smallCategoryId) {
		SiteBoardDao siteBoardDao;
		siteBoardDao = sqlSession.getMapper(SiteBoardDao.class);
		return siteBoardDao.getListSpeed(page, query, bigCategoryId, smallCategoryId);
	}*/





}
