package aaa.bbb.ccc.controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import aaa.bbb.ccc.util.AdoptionService;
import aaa.bbb.ccc.util.MemberService;
import aaa.bbb.ccc.vo.MemberVO;
import aaa.bbb.ccc.vo.UserVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService mDao ;
	
	@Autowired
	private AdoptionService aDao ;
	
	@RequestMapping(value="/")
	public ModelAndView home(HttpServletRequest request,MemberVO mvo,ModelAndView mav,@RequestParam Map<String,Object> map) {
		
		List<Map<String,Object>> list = aDao.adoptionList(map);
		mav.addObject("list",list);
		mav.setViewName("test1");
		return mav;
	}
	
	@RequestMapping(value="/home")
	public ModelAndView home1(HttpServletRequest request,MemberVO mvo,ModelAndView mav,@RequestParam Map<String,Object> map) {
		
		List<Map<String,Object>> list = aDao.adoptionList(map);
		mav.addObject("list",list);
		mav.setViewName("test1");
		return mav;
	}
	
	@RequestMapping(value="/myPage")
	public ModelAndView myPage(HttpServletRequest request,MemberVO mvo,ModelAndView mav,@RequestParam Map<String,Object> map) {
		
		List<Map<String,Object>> myAlist = aDao.myAlist(map);
		mav.addObject("list",myAlist);
		
		mav.setViewName("member/myPage");
		return mav;
	}
	
	@RequestMapping(value="/memberDeleteForm")
	   public String memberDeleteForm(HttpServletRequest request,MemberVO mvo) {
	      return "member/memberDeleteForm";
	   }
	
	@RequestMapping(value="/updateForm")
	   public ModelAndView updateForm(HttpServletRequest request,MemberVO mvo,ModelAndView mav) {
		
	   HttpSession session = request.getSession();
	   mvo = (MemberVO)session.getAttribute("Login");
	   
	  String detail = mvo.getDetail();
	  int index = detail.indexOf("-");
	  String detail1 = detail.substring(0,index);
	  String detail2 = detail.substring(index+1);
	  
	  mav.addObject("detail1",detail1);
	  mav.addObject("detail2",detail2);
	  mav.setViewName("member/updateForm");
		return mav;
	 }//updateForm
	
	@RequestMapping(value="/idcheck")
	public ModelAndView idcheck(HttpServletRequest request,ModelAndView mav,MemberVO mvo) {
		
		mvo = mDao.idcheck(mvo);
		
		mav.addObject("checkResult",mvo);
		mav.setViewName("member/idcheck");
		
		return mav;
	}//idcheck
	
	@RequestMapping(value="/memberjoin")
	public ModelAndView memberjoin(HttpServletRequest request,ModelAndView mav,MemberVO mvo) {
		
		mDao.memberInsert(mvo);
		mav.setViewName("test1");
		return mav;
	}//memberJoin
	
	@RequestMapping(value="/login")
	public ModelAndView login(HttpServletRequest request, ModelAndView mav, MemberVO mvo)  
			throws ServletException, IOException {
		mvo = mDao.memberDetail(mvo);
		HttpSession session = request.getSession() ;
		session.setAttribute("Login", mvo);

		mav.addObject("idcheck", mvo);
		mav.setViewName("member/logincheck");
		return mav;
	} // login	
	
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mav)  
			throws ServletException, IOException {
		HttpSession session = request.getSession() ;
		session.invalidate();
		
		mav.setViewName("redirect:home");
		return mav;
	} // logout
	
	@RequestMapping(value="/mdelete")
	public ModelAndView mdelete(HttpServletRequest request, ModelAndView mav,MemberVO mvo,UserVO uvo)  
			throws ServletException, IOException {
		HttpSession session = request.getSession() ;
		mvo = (MemberVO)session.getAttribute("Login");
		
		int result = mDao.memberDelete(mvo);
		if(result>0) {
			session.invalidate();
			mav.setViewName("redirect:home");
		}
		return mav;
	} // logout
	
	@RequestMapping(value="/memberUpdate")
	public ModelAndView memberUpdate(HttpServletRequest request, ModelAndView mav,MemberVO mvo,UserVO uvo)  
			throws ServletException, IOException {
		
		String pw="";
		
		if(mvo.getPw()!=null) {
			pw = mvo.getPw();
			
		}
		String exp = mvo.getExp();
		String detail1 = mvo.getDetail1();
		String detail2 = mvo.getDetail2();
		
		HttpSession session = request.getSession() ;
		mvo = (MemberVO)session.getAttribute("Login");

		if(pw=="") {
			pw = mvo.getPw();
		}
		
		mvo.setPw(pw);
		mvo.setExp(exp);
		mvo.setDetail1(detail1);
		mvo.setDetail2(detail2);
		
		int result =mDao.memberUpdate(mvo);
		
		if(result>0) {
		mvo = mDao.idcheck(mvo);
		mav.setViewName("member/myPage");
		session.invalidate();
		HttpSession session2 = request.getSession() ;
		session2.setAttribute("Login", mvo);
		}
		return mav;
	} // logout
	
	@RequestMapping(value="/imgUpload")
	public ModelAndView imgUpload(HttpServletRequest request, ModelAndView mav,MemberVO mvo,UserVO uvo)  
			throws ServletException, IOException {
		
		MultipartFile uploadfilef = mvo.getUploadfilef(); 
		String fname1, fname2 = "NoImage" ;
		
		if (!uploadfilef.isEmpty()) {
			fname1="C:/Users/yoon9/git/Petmily/Petmily/src/main/webapp/resources/img/"+uploadfilef.getOriginalFilename();
			uploadfilef.transferTo(new File(fname1)); 
			fname2="resources/img/"+uploadfilef.getOriginalFilename();
		}
		
		mvo.setMyimage(fname2);
		mDao.imgUpdate(mvo);
		String img = mvo.getMyimage();
		HttpSession session = request.getSession() ;
		mvo = (MemberVO)session.getAttribute("Login");
		mvo.setMyimage(img);
		session.setAttribute("Login", mvo);
		
		mav.setViewName("member/myImage");
		
		return mav;
	} // logout
}