package spring.test.mrbin;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

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

import spring.model.memo.memoDAO;
import spring.model.memo.memoVO;

public class memoDAOTest {
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
		memoDAO dao= (memoDAO) beans.getBean("memodao");
		memoVO vo = new memoVO();
		vo.setTitle("제목");
		vo.setContent("내용");
		assertEquals(1,dao.create(vo));
	}

	@Test @Ignore
	public void testRead() {
		memoDAO dao= (memoDAO) beans.getBean("memodao");
		memoVO vo= dao.read(1401);
		assertEquals(1401, vo.getMemono());
		assertEquals("제목", vo.getTitle());
		assertEquals("내용", vo.getContent());
	}

	@Test @Ignore
	public void testUpdate() {
		memoDAO dao= (memoDAO) beans.getBean("memodao");
		memoVO vo = new memoVO();
		vo.setTitle("제목수정");
		vo.setContent("내용수정");
		vo.setMemono(1401);
		assertEquals(1, dao.update(vo));
	}

	@Test @Ignore
	public void testDelete() {
		memoDAO dao= (memoDAO) beans.getBean("memodao");
		assertEquals(1, dao.delete(1401));
	}

	@Test @Ignore
	public void testList() {
		memoDAO dao= (memoDAO) beans.getBean("memodao");
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		List<memoVO> list=dao.list(map);
		assertEquals(5,list.size());
	}

	@Test @Ignore
	public void testTotal() {
		memoDAO dao= (memoDAO) beans.getBean("memodao");
		assertEquals(9, dao.total("", ""));
	}

	@Test @Ignore
	public void testUpViewcnt() {
		memoDAO dao= (memoDAO) beans.getBean("memodao");
		dao. upViewcnt(1101);
		memoVO vo= dao.read(1101);
		assertEquals(1, vo.getViewcnt());
		
	}

}
