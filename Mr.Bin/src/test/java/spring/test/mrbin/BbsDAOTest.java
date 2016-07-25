package spring.test.mrbin;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import spring.model.bbs.BbsDAO;
import spring.model.bbs.BbsDTO;

public class BbsDAOTest {
	private static BeanFactory beans;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("MrBin.xml");
		beans=new XmlBeanFactory(resource);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test @Ignore
	public void testCreate() {
		BbsDAO dao= (BbsDAO) beans.getBean("bbsdao");
		BbsDTO dto= new BbsDTO();
		dto.setWname("홍길동");
		dto.setTitle("제목");
		dto.setContent("내용");
		dto.setPasswd("1234");
		assertEquals(1,dao.create(dto));
	}

	@Test @Ignore
	public void testRead() {
		BbsDAO dao= (BbsDAO) beans.getBean("bbsdao");
		BbsDTO dto= dao.read(25);
		assertEquals("홍길동", dto.getWname());
		assertEquals("제목", dto.getTitle());
		assertEquals("내용", dto.getContent());
		assertEquals(0, dto.getViewcnt());
	}

	@Test @Ignore
	public void testUpdate() {
		BbsDAO dao= (BbsDAO) beans.getBean("bbsdao");
		BbsDTO dto= new BbsDTO();
		dto.setWname("홍길동");
		dto.setTitle("제목수정");
		dto.setContent("내용수정");
		dto.setPasswd("1234");
		dto.setBbsno(25);
		assertEquals(1, dao.update(dto));
	}

	@Test @Ignore
	public void testDelete() {
		BbsDAO dao= (BbsDAO) beans.getBean("bbsdao");
		assertEquals(1, dao.delete(25));
	}

	@Test //@Ignore
	public void testList() {
		BbsDAO dao= (BbsDAO) beans.getBean("bbsdao");
		Map map= new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		List<BbsDTO> list= dao.list(map);
		assertEquals(5, list.size());
	}

	@Test @Ignore
	public void testTotal() {
		BbsDAO dao= (BbsDAO) beans.getBean("bbsdao");
		assertEquals(11, dao.total("", ""));
	}

	@Test @Ignore
	public void testReadReply() {
		BbsDAO dao= (BbsDAO) beans.getBean("bbsdao");
		BbsDTO dto= dao.readReply(24);
		assertEquals("사진", dto.getTitle());
		assertEquals(13, dto.getGrpno());
		assertEquals(1, dto.getIndent());
		assertEquals(1, dto.getAnsnum());
	}

	@Test @Ignore
	public void testReply() {
		BbsDAO dao= (BbsDAO) beans.getBean("bbsdao");
		BbsDTO dto= new BbsDTO();
		dto.setWname("고길동");
		dto.setTitle("제목");
		dto.setContent("내용");
		dto.setPasswd("1234");
		dto.setGrpno(13);
		dto.setIndent(0);
		dto.setAnsnum(0);
		dto.setRefnum(21);
		assertEquals(1, dao.reply(dto));
		
	}

	@Test @Ignore
	public void testAddAnsnum() {
		BbsDAO dao= (BbsDAO) beans.getBean("bbsdao");
		dao.addAnsnum(13, 0);
		BbsDTO dto=dao.readReply(25);
		assertEquals(2, dto.getAnsnum());
	
	}

	@Test @Ignore
	public void testRefnumCheck() {
		BbsDAO dao= (BbsDAO) beans.getBean("bbsdao");
		assertTrue(dao.refnumCheck(21));
	}

	@Test @Ignore
	public void testIncreaseViewcnt() {
		BbsDAO dao= (BbsDAO) beans.getBean("bbsdao");
		dao.increaseViewcnt(25);
		BbsDTO dto=dao.read(25);
		assertEquals(3, dto.getViewcnt());
	}

	@Test @Ignore
	public void testCheckPasswd() {
		BbsDAO dao= (BbsDAO) beans.getBean("bbsdao");
		assertEquals(1, dao.checkPasswd(26, "1234"));
	}

}
