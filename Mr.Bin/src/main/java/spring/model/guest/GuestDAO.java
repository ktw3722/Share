package spring.model.guest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GuestDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public int create(String content,String mname,String wdate){
		Map map= new HashMap();
		map.put("content", content);
		map.put("mname", mname);
		map.put("wdate", wdate);
		return mybatis.insert("guest.create",map);
	}
	
	 public GuestDTO read(int guestno){
		   return mybatis.selectOne("guest.read", guestno);
		  }
	 
	 public List<GuestDTO> list(){
		   return mybatis.selectList("guest.list");
		 }
}