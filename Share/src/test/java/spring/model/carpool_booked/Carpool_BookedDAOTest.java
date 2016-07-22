package spring.model.carpool_booked;

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

import spring.model.carpool_booked.Carpool_BookedDAO;
import spring.model.carpool_booked.Carpool_BookedDTO;

public class Carpool_BookedDAOTest {

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
		Carpool_BookedDAO carpool_bookedDAO= (Carpool_BookedDAO) beans.getBean("carpool_bookeddao");
		Carpool_BookedDTO carpool_bookedDTO= new Carpool_BookedDTO();
		carpool_bookedDTO.setCarpoolno(1);
		carpool_bookedDTO.setAppli_id("ktw3722");
		carpool_bookedDTO.setWriter_id("user1");
		carpool_bookedDTO.setType("단기카풀");
		carpool_bookedDTO.setKind("타세요");
		carpool_bookedDTO.setAppli_seat(2);
		assertEquals(1,carpool_bookedDAO.create(carpool_bookedDTO));
	}

	@Test @Ignore
	public void testRead() {
		Carpool_BookedDAO carpool_bookedDAO= (Carpool_BookedDAO) beans.getBean("carpool_bookeddao");
		Carpool_BookedDTO carpool_bookedDTO= carpool_bookedDAO.read(1);
		assertEquals(1, carpool_bookedDTO.getCp_bookedno());
		assertEquals("ktw3722", carpool_bookedDTO.getAppli_id());
		assertEquals("user1", carpool_bookedDTO.getWriter_id());
		assertEquals("태워주세요", carpool_bookedDTO.getKind());
		assertEquals("정기카풀", carpool_bookedDTO.getType());
		assertEquals(2, carpool_bookedDTO.getAppli_seat());
		assertEquals(1, carpool_bookedDTO.getCarpoolno());
	}

	@Test @Ignore
	public void testUpdate() {
		Carpool_BookedDAO carpool_bookedDAO= (Carpool_BookedDAO) beans.getBean("carpool_bookeddao");
		Carpool_BookedDTO carpool_bookedDTO= new Carpool_BookedDTO();
		carpool_bookedDTO.setType("단기카풀");
		carpool_bookedDTO.setKind("타세요");
		carpool_bookedDTO.setAppli_seat(2);
		carpool_bookedDTO.setCp_bookedno(1);
		assertEquals(1, carpool_bookedDAO.update(carpool_bookedDTO));
	}

	@Test @Ignore
	public void testDelete() {
		Carpool_BookedDAO carpool_bookedDAO= (Carpool_BookedDAO) beans.getBean("carpool_bookeddao");
		assertEquals(1, carpool_bookedDAO.delete(2));
	}

	@Test @Ignore
	public void testList() {
		Carpool_BookedDAO carpool_bookedDAO= (Carpool_BookedDAO) beans.getBean("carpool_bookeddao");
		Map map=new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		List<Carpool_BookedDTO> list = carpool_bookedDAO.list(map);
		assertEquals(1, list.size());
	}

	@Test @Ignore
	public void testTotal() {
		Carpool_BookedDAO carpool_bookedDAO= (Carpool_BookedDAO) beans.getBean("carpool_bookeddao");
		assertEquals(1,carpool_bookedDAO.total("", "") );
	}

}
