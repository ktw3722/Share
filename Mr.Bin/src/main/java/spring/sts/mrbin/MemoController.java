package spring.sts.mrbin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.bbs.BbsDTO;
import spring.model.memo.memoDAO;
import spring.utility.mrbin.Paging;
import spring.utility.mrbin.Utility;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemoController {
	@Autowired
	private memoDAO dao;
	
	@RequestMapping("/memo/list")
	public String list(HttpServletRequest request,Model model){
		return "";
	}
}
