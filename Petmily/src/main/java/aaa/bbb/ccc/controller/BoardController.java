package aaa.bbb.ccc.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import aaa.bbb.ccc.util.NoticeService;
import aaa.bbb.ccc.vo.MemberVO;

@Controller
public class BoardController {
	
	@Autowired
	private NoticeService nDao ;
	
	@RequestMapping(value="/noticeInsert")
	   public ModelAndView noticeInsert(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav)
			  throws ServletException, IOException{
		
		 nDao.nInsert(map);
		 mav.setViewName("redirect:noticeList");
	      return mav;
	   }
	
	@RequestMapping(value="/noticeList")
	   public ModelAndView noticeList(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav)
			  throws ServletException, IOException{
		
		 int totalCount = nDao.totalCount();
		 
		 int cPage=1;
		 if(request.getParameter("currPage")!=null) {
			 cPage = Integer.parseInt(request.getParameter("currPage"));
		 }
		 
		 int perPage = 10;
		 int skip = 0;
		 
		 if(cPage>1) {
			 skip = (cPage-1)*perPage;
		 }
		 int fno = skip+1;
		 int lno = skip+perPage;
		 
		 map.put("fno",fno);
		 map.put("lno",lno);
		 
		 List<Map<String,Object>> noticeList = nDao.noticeList(map);
		 
		 int totalPage = totalCount / perPage;
		 if(totalCount % perPage != 0) totalPage++;
		 
		 mav.addObject("notice",noticeList);
		 mav.addObject("totalPage", totalPage);
		 mav.addObject("currPage", cPage);
		mav.setViewName("board/noticeList");
	      return mav;
	   }

	@RequestMapping(value="/noticeDetail")
	   public ModelAndView noticeDetail(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav,MemberVO mvo)
			  throws ServletException, IOException{
		
		HttpSession session = request.getSession();
		mvo = (MemberVO)session.getAttribute("Login");
		if(mvo!=null) {
			if(!mvo.getId().equals("admin"))
				nDao.countUp(map);
		}else nDao.countUp(map);
		
		Map<String,Object> detail = nDao.noticeDetail(map);
		mav.addObject("detail",detail);
		
		if (mvo!=null) {
			if (mvo.getId().equals("admin")) 
				mav.setViewName("board/noticeDetailA");
			else 
				mav.setViewName("board/noticeDetail");
		}   else
			mav.setViewName("board/noticeDetail");
		 
	      return mav;
	   }
	
	@RequestMapping(value="/noticeUpdate")
	   public ModelAndView noticeUpdate(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav)
			  throws ServletException, IOException{
		
		 nDao.noticeUpdate(map);
		 mav.setViewName("redirect:noticeList");
	      return mav;
	   }
	
	@RequestMapping(value="/noticeDelete")
	   public ModelAndView noticeDelete(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav)
			  throws ServletException, IOException{
		
		 nDao.noticeDelete(map);
		 mav.setViewName("redirect:noticeList");
	      return mav;
	   }

	
}
