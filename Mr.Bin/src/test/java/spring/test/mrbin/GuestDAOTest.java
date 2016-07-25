package spring.test.mrbin;

import static org.junit.Assert.*;

import java.util.List;

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

import spring.model.guest.GuestDAO;
import spring.model.guest.GuestDTO;

public class GuestDAOTest {
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
		GuestDAO dao=(GuestDAO) beans.getBean("guestdao");
		assertEquals(1,dao.create("테스트", "김성빈", "2016-07-01"));
	}

	@Test @Ignore
	public void testRead() {
		GuestDAO dao=(GuestDAO) beans.getBean("guestdao");
		GuestDTO dto=dao.read(1);
		assertEquals("김성빈", dto.getMname());
		assertEquals("하하하", dto.getContent());
	}

	@Test @Ignore
	public void testList() {
		GuestDAO dao=(GuestDAO) beans.getBean("guestdao");
		List<GuestDTO> list=dao.list();
		assertEquals(33, list.size());
	}

}
