package mvc;

import static org.junit.Assert.*;

import java.util.List;

import kr.or.ddit.uri.dao.IUriDao;
import kr.or.ddit.uri.dao.UriDaoImpl;
import kr.or.ddit.uri.model.UriVO;

import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UriDaoTest {
	
	private static final Logger logger = LoggerFactory
			.getLogger(UriDaoTest.class);
	
	private IUriDao dao;
	
	@Before
	public void setup(){
		dao = new UriDaoImpl();
	}
	
	/**
	* Method : getAllUriMappingTest
	* 작성자 : PC14
	* 변경이력 :
	* Method 설명 : uri리스트 조회
	*/
	@Test
	public void getAllUriMappingTest() {
		/***Given***/
		

		/***When***/
		List<UriVO> uriList = dao.getAllUriMapping();
		
		/***Then***/
		assertEquals(2, uriList.size());
		for(UriVO uriVO : uriList){
			logger.debug("uriVO : {}",uriVO);
		}
	}

	
	@Test
	public void getUriMappingTest(){
		/***Given***/
		String uri = "/main.do";

		/***When***/
		UriVO uriVO = dao.getUriMapping(uri);
		
		/***Then***/
		assertNotNull(uriVO);
		logger.debug("uriVO : {}", uriVO);
	}
	
}
