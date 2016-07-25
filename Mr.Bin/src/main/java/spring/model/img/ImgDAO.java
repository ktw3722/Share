package spring.model.img;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ImgDAO {
	
	@Autowired
	private static SqlSessionTemplate mybatis;
	
	public static void setMybatis(SqlSessionTemplate mybatis) {
		ImgDAO.mybatis = mybatis;
	}

	/**
	 * 1. create
	 * 
	 * @param dto
	 * @return
	 */
	public int create(ImgDTO dto) {
		return mybatis.insert("img.create", dto);
	}

	/**
	 * 2.read
	 * 
	 * @param dto
	 * @return
	 */
	
	public ImgDTO read(int imgno) {
		return mybatis.selectOne("img.read", imgno);
	}
	/**
	 * 3. update
	 * 
	 * @param dto
	 * @return
	 */
	public int update(ImgDTO dto) {
	    return mybatis.update("img.update",dto);
	}
	
	/**
	 * 4.delete
	 * 
	 * @param dto
	 * @return
	 */
	public int delete(int imgno) {
		return mybatis.delete("img.delete", imgno);
	}
	
	/**
	 * 5.list
	 * 
	 * @param dto
	 * @return
	 * 
	 */
	
	public List<ImgDTO> list(Map map) {
		return mybatis.selectList("img.list",map);
	}
	
	/**
	 * 6.total
	 * 
	 * @param dto
	 * @return
	 */
	public int total(String col, String word) {
		Map map= new HashMap();
		map.put("col", col);
		map.put("word", word);
		return mybatis.selectOne("img.total",map);
	}
	
	/**
	 * 7.updatefile
	 * 
	 * @param dto
	 * @return
	 */
	public int updateFile(String fname, String imgno) {
		Map map=new HashMap();
		map.put("fname", fname);
		map.put("imgno", imgno);
		return mybatis.update("img.update",map);
	}

	/**
	 * 8.imgRead
	 * 
	 * @param dto
	 * @return
	 */	
	public ImgDTO imgRead(int imgno) {
		return mybatis.selectOne("img.imgRead", imgno);
	}
	
	/**
	 * 9.readReply
	 * 답변처리를 위해서 부모의 grpno, indent, ansnum을 가져오는 것 title, imgno 포함해서 가져오기
	 * 
	 * @param imgno
	 * @return
	 */
	public ImgDTO readReply(int imgno) {
		return mybatis.selectOne("img.readReply", imgno);
	}
	
	/**
	 * 10.addAnsnum
	 * 
	 * @param dto
	 * @return
	 */
	public void addAnsnum(int grpno, int ansnum) {
		Map map = new HashMap();
		map.put("grpno", grpno);
		map.put("ansnum", ansnum);
		mybatis.update("img.addAnsnum", map);
	}
	
	/**
	 * 11.reply
	 * 답변등록
	 * 
	 * @param dto
	 * @return
	 */
	public int reply(ImgDTO dto) {
		return mybatis.insert("img.reply", dto);
	}
	
	/**
	 * 12.passwdCheck
	 * 
	 * @param dto
	 * @return
	 */
	public int passwdCheck(int imgno, String passwd) {
		Map map=new HashMap();
		map.put("imgno", imgno);
		map.put("passwd", passwd);
		return mybatis.selectOne("img.passwdCheck", map);
	}

}
