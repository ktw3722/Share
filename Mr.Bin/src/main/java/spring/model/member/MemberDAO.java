package spring.model.member;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired
	private static SqlSessionTemplate mybatis;

	public static void setMybatis(SqlSessionTemplate mybatis) {
		MemberDAO.mybatis = mybatis;
	}

	public int create(MemberDTO dto) {
		return mybatis.insert("member.create", dto);
	}

	public MemberDTO read(String id) {
		return mybatis.selectOne("member.read", id);
	}

	public int update(MemberDTO dto) {
		return mybatis.update("member.update", dto);
	}

	public int delete(String id) {
		return mybatis.delete("member.delete", id);
	}

	public List<MemberDTO> list(Map map) {
		return mybatis.selectList("member.list", map);
	}

	public int total(String col, String word) {
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		return mybatis.selectOne("member.total", map);
	}

	public int updateFile(String id, String fname, String oldfile) {
		Map map = new HashMap();
		map.put("id", id);
		map.put("fname", fname);
		map.put("oldfile", oldfile);
		return mybatis.update("member.updateFile", map);
	}

	public int updatePasswd(String id, String passwd) {
		Map map = new HashMap();
		map.put("id", id);
		map.put("passwd", passwd);
		return mybatis.update("member.updatePasswd", map);
	}

	public int loginCheck(String id, String passwd) {
		Map map = new HashMap();
		map.put("id", id);
		map.put("passwd", passwd);
		return mybatis.selectOne("member.loginCheck", map);
	}

	public String idFind(String mname, String email) {
		Map map = new HashMap();
		map.put("mname", mname);
		map.put("email", email);
		return mybatis.selectOne("member.idFind", map);
	}

	public String pwFind(String id, String mname) {
		Map map = new HashMap();
		map.put("id", id);
		map.put("mname", mname);
		return mybatis.selectOne("member.pwFind", map);
	}

	public int duplicateEmail(String email) {
		return mybatis.selectOne("member.duplicateEmail", email);
	}

	public int duplicateID(String id) {
		return mybatis.selectOne("member.duplicateID", id);
	}

	public String getGrade(String id) {
		return mybatis.selectOne("member.getGrade", id);
	}

	public String getName(String id) {
		return mybatis.selectOne("member.getName", id);
	}

	public String getFname(String id) {
		return mybatis.selectOne("member.getFname", id);
	}

}
