package spring.model.carpool_reply;

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

import spring.model.carpool_reply.Carpool_ReplyDAO;
import spring.model.carpool_reply.Carpool_ReplyDTO;

public class Carpool_ReplyDAOTest {

	private static BeanFactory beans;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("ksb.xml");
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
		Carpool_ReplyDAO dao=(Carpool_ReplyDAO) beans.getBean("carpool_replydao");
		Carpool_ReplyDTO dto=new Carpool_ReplyDTO();
		dto.setId("ktw3722");
		dto.setContent("싫어요");
		dto.setCarpoolno(1);
		assertEquals(1,dao.create(dto));
	}

	@Test @Ignore
	public void testRead() {
		Carpool_ReplyDAO dao=(Carpool_ReplyDAO) beans.getBean("carpool_replydao");
		Carpool_ReplyDTO dto=dao.read(3);
		assertEquals(3, dto.getCrep_no());
		assertEquals("싫어요", dto.getContent());
		assertEquals("ktw3722", dto.getId());
		assertEquals(1, dto.getCarpoolno());
	}

	@Test @Ignore
	public void testUpdate() {
		Carpool_ReplyDAO dao=(Carpool_ReplyDAO) beans.getBean("carpool_replydao");
		Carpool_ReplyDTO dto=new Carpool_ReplyDTO();
		dto.setContent("좋을까나?");
		dto.setCrep_no(3);
		assertEquals(1, dao.update(dto));
	}

	@Test @Ignore
	public void testDelete() {
		Carpool_ReplyDAO dao=(Carpool_ReplyDAO) beans.getBean("carpool_replydao");
		assertEquals(1, dao.delete(3));
	}

	@Test @Ignore
	public void testList() {
		Carpool_ReplyDAO dao=(Carpool_ReplyDAO) beans.getBean("carpool_replydao");
		Map map=new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		List<Carpool_ReplyDTO> list=dao.list(map);
		assertEquals(1, list.size());
	}

	@Test @Ignore
	public void testTotal() {
		Carpool_ReplyDAO dao=(Carpool_ReplyDAO) beans.getBean("carpool_replydao");
		assertEquals(1, dao.total("", ""));
	}

}
