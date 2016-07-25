package spring.model.memo;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class memoDAO {//Data Access Object :데이터베이스 처리
	@Autowired
	private static SqlSessionTemplate mybatis;
	
	public static void setMybatis(SqlSessionTemplate mybatis) {
		memoDAO.mybatis = mybatis;
	}

	public int create(memoVO vo){
		return mybatis.insert("memo.create", vo);
	}
	
	public memoVO read(int memono){
		return mybatis.selectOne("memo.read",memono);
	}
	
	public int update(memoVO vo){
		return mybatis.update("memo.update", vo);
	}
	
	public int delete(int memono){
		return mybatis.delete("memo.delete", memono);
	}
	
	public List<memoVO> list(Map map){
		return mybatis.selectList("memo.list", map);
	}
	
	public int total(String col,String word){
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		return mybatis.selectOne("memo.total", map);
	}
	
	public void upViewcnt(int memono){
		mybatis.update("memo.upViewcnt",memono);
	}
	
}
