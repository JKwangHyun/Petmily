package aaa.bbb.ccc.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import aaa.bbb.ccc.util.AdoptionService;
import aaa.bbb.ccc.vo.MemberVO;

@Controller
public class AdoptionController {
	
	@Autowired
	private AdoptionService aDao ;

	
	
	@RequestMapping(value="/registration")
	public String registration() {
		return "adoption/registration";
	}
	
	@RequestMapping(value="/aa")
	   public void aa(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav,MemberVO mvo)
			  throws ServletException, IOException{
		
		String id = request.getParameter("id");
		
	   }

	@RequestMapping(value="/adoptionList")
	   public ModelAndView adoptionList(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav,MemberVO mvo)
			  throws ServletException, IOException{
		
		List<Map<String,Object>> list = aDao.adoptionList(map);
		System.out.println(list);
		mav.addObject("list",list);
		
		if(map.get("PETTYPE")!="") {
		HttpSession session = request.getSession();
		session.setAttribute("PetType", map.get("PETTYPE"));
		}
		mav.setViewName("adoption/adoptionList");
	      return mav;
	   }
	
	@RequestMapping(value="/adoptionDetail")
	   public ModelAndView adoptionDetail(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav,MemberVO mvo)
			  throws ServletException, IOException{
		System.out.println(map.get("root"));
		
		Map<String,Object> likeCheck = aDao.likeCheck(map);
		aDao.likeCount(map);
		Map<String,Object> detail = aDao.adoptionDetail(map);
		System.out.println(detail);
		HttpSession session = request.getSession();
		mvo = (MemberVO)session.getAttribute("Login");
		
		HttpSession session2 = request.getSession();
		session2.setAttribute("Detail", detail.get("ID"));
		
		
		
		if(mvo!=null) {
			if(mvo.getId() != detail.get("ID")) {
				aDao.countUp(map);
				mav.setViewName("adoption/adoptionDetail");
			}else mav.setViewName("adoption/adoptionDetailA");
		}else {
			aDao.countUp(map);
			mav.setViewName("adoption/adoptionDetail");
		}
			
		mav.addObject("detail",detail);
		mav.addObject("likeCheck",likeCheck);
	      return mav;
	   }
	
	@RequestMapping(value="/adoptionDelete")
	   public ModelAndView adoptionDelete(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav,MemberVO mvo)
			  throws ServletException, IOException{
		System.out.println(map.get("SEQ"));
		aDao.adoptionDelete(map);
		
		mav.setViewName("redirect:adoptionList");
		
	      return mav;
	   }
	
	@RequestMapping(value="/categoryList")
	   public ModelAndView categoryList(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav,MemberVO mvo)
			  throws ServletException, IOException{
		
		if((map.get("PETTYPE").equals("showall"))||(map.get("PETTYPE")=="")) {
			List<Map<String,Object>> ClistAll = aDao.adoptionList(map);
			mav.addObject("list",ClistAll);
		}else {
			List<Map<String,Object>> Clist = aDao.categoryList(map);
			mav.addObject("list",Clist);
		}

		mav.setViewName("adoption/categoryList");
		
	      return mav;
	   }
	
	@RequestMapping(value="/REinsert")
	   public ModelAndView REinsert(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav,RedirectAttributes redirectAttributes	)
			  throws ServletException, IOException{
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+map.get("myimage"));
		int step = Integer.valueOf((String)map.get("step"));
		int indent = Integer.valueOf((String)map.get("indent"));
		int root1 = 0;
		
		if(map.get("seq")!=null) {
			root1 = Integer.valueOf((String)map.get("seq"));
		}
		map.put("step",++step);
		map.put("indent",++indent);
		map.put("root1",root1);
		
		aDao.REinsert(map);
		redirectAttributes.addAttribute("root",map.get("root"));
		
		if(map.get("seq")!=null) {
			redirectAttributes.addAttribute("root1",map.get("root1"));
			mav.setViewName("redirect:RErelist");
		}else mav.setViewName("redirect:RElist");
		
	      return mav;
	   }
	
	@RequestMapping(value="/RElist")
	   public ModelAndView RElist(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav,@RequestParam(value="root",defaultValue="defaultValue")String root)
			  throws ServletException, IOException{
			
			if(!root.equals("defaultValue")) map.put("root",root);
				
			List<Map<String,Object>> RElist = aDao.RElist(map);
			
			mav.addObject("RElist",RElist);
			mav.setViewName("adoption/RElist");
		
		
		
	      return mav;
	   }
	
	@RequestMapping(value="/RErelist")
	   public ModelAndView RErelist(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav,@RequestParam(value="root",defaultValue="defaultValue")String root,@RequestParam(value="root1",defaultValue="defaultValue")String root1)
			  throws ServletException, IOException{
		
		if(!root1.equals("defaultValue")) {
			map.put("root1",root1);
		}
		else {
			map.put("root1",map.get("seq"));
		}
		if(!root.equals("defaultValue")) {
			map.put("root",root);
		}
		List<Map<String,Object>> RElist = aDao.RErelist(map);
		
		mav.addObject("RElist",RElist);
		mav.setViewName("adoption/RErelist");
			
		return mav;
	   }
	
	@RequestMapping(value="/cUpdate")
	public ModelAndView noticeUpdate(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav)
			  throws ServletException, IOException{
		
		 aDao.completeUpdate(map);
		 mav.setViewName("redirect:adoptionList");
	   return mav;
	}
	
	@RequestMapping(value="/Aregistration")
	   public ModelAndView Aregistration(HttpServletRequest request,
	         ModelAndView mav, @RequestParam Map<String,Object> map, @RequestParam("uploadMimg") MultipartFile uploadfilef, @RequestParam("uploadSimg") List<MultipartFile> uploadfilefS)
	               throws ServletException, IOException {
	      System.out.println(uploadfilefS.toString());
	      String fname1, fname2 = "NoImage" ;
	      String fname3 = "NoImage" ;
	      String fname4 = "";
	      
	      // 단일 파일 업로드
	      if (!uploadfilef.isEmpty()) {
	         fname1="C:/Users/yoon9/git/Petmily/Petmily/src/main/webapp/resources/img/"+uploadfilef.getOriginalFilename();
	         uploadfilef.transferTo(new File(fname1));
	         fname2="resources/img/"+uploadfilef.getOriginalFilename();
	      }
	      map.put("mainimg", fname2);
	      
	      // 다중 파일 업로드
	      if (!uploadfilefS.isEmpty()) {
	         for(MultipartFile i:uploadfilefS) {
	            fname3="C:/Users/yoon9/git/Petmily/Petmily/src/main/webapp/resources/img/"+i.getOriginalFilename();
	            i.transferTo(new File(fname3));
	            if(fname4.equals(""))
	               fname4 += "resources/img/"+i.getOriginalFilename();
	            else 
	               fname4 += ",resources/img/"+i.getOriginalFilename();
	            System.out.println(fname4);
	         }
	      }
	      map.put("subimg",fname4);
	      
	      aDao.registration(map);
	      mav.setViewName("test1");
	      return mav ;
	   }
	
	@RequestMapping(value="/likeInsert")
	   public ModelAndView likeInsert(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav)
			  throws ServletException, IOException{
		aDao.insertLike(map);
		mav.setViewName("test1");
		
	      return mav;
	   }
	
	@RequestMapping(value="/likeDelete")
	   public ModelAndView likeDelete(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav,RedirectAttributes redirectAttributes	)
			  throws ServletException, IOException{
		aDao.deleteLike(map);
		mav.setViewName("test1");
		
	      return mav;
	   }
	
	@RequestMapping(value="/myList")
	   public ModelAndView myList(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav,RedirectAttributes redirectAttributes	)
			  throws ServletException, IOException{
		
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!"+map.get("menu"));
		if(map.get("menu").equals("myAdoptionList")) {
			List<Map<String,Object>> myAlist = aDao.myAlist(map);
			mav.addObject("list",myAlist);
		}else if(map.get("menu").equals("myLikeList")) {
			List<Map<String,Object>> myLlist = aDao.myLlist(map);
			mav.addObject("list",myLlist);
		}else if(map.get("menu").equals("myBoardList")) {
			
		}
		mav.setViewName("adoption/categoryList");
		return mav;
	   }
		
   @RequestMapping(value="/findHospital")
	public void findHospital(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
	   
     	request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8"); 

	   
        String addr = " https://openapi.gg.go.kr/Animalhosptl?Key=";
        String serviceKey = "d2c430694f4e4048af071fd2acbfce2c";
        String parameter = "";
        String SIGUN_NM = URLEncoder.encode(request.getParameter("SIGUN_NM"),"utf-8");
        PrintWriter out = response.getWriter();                                        //클라이언트로 보낼 TEXT DATA, JSON에 넣을 때 쭉 나열하는듯
 
        parameter = parameter + "&" + "SIGUN_NM=" + SIGUN_NM;        //JSP에서 받아올 contentid, contentTypeid
        parameter = parameter + "&" + "pIndex=1";
        parameter = parameter + "&" + "pSize=100";
        parameter = parameter + "&" + "Type=json";
 
        addr = addr + serviceKey + parameter;
        URL url = new URL(addr);
 
        System.out.println(addr);
 
        InputStream in = url.openStream();                            //URL로 부터 자바로 데이터 읽어오도록 URL객체로 스트림 열기
 
        ByteArrayOutputStream bos1 = new ByteArrayOutputStream();
        IOUtils.copy(in, bos1);
        in.close();
        bos1.close();
 
        String mbos = bos1.toString("UTF-8");    
         
        byte[] b = mbos.getBytes("UTF-8");
        String s = new String(b, "UTF-8");        //String으로 풀었다가 byte배열로 했다가 다시 String으로 해서 json에 저장할 배열을 print?? 여긴 잘 모르겠다
        out.println(s);
        System.out.println(s);
        
        
        JSONObject json = new JSONObject();
        json.put("data", s);                                                           
    }
}
	
	/*@RequestMapping(value="/RElist")
	   public ModelAndView REdetail(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav,@RequestParam(value="root",defaultValue="defaultValue")String root,@RequestParam(value="root1",defaultValue="defaultValue")String root1)
			  throws ServletException, IOException{
		System.out.println("aaaaa"+map.get("seq"));
		if(((root1.equals("defaulValue"))&&(map.get("seq")==null)) || (root1.equals("defaulValue")&&map.get("root")!=null&&(map.get("seq")==null))) {
			System.out.println("ccccc");
			if(!root.equals("defaultValue")) {
				map.put("root",root);
			}
				
			List<Map<String,Object>> RElist = aDao.RElist(map);
			
			mav.addObject("RElist",RElist);
			mav.setViewName("adoption/RElist");
		}else if((!root1.equals("dafaultValue"))||((map.get("seq")!=null)&&(root1.equals("defaultValue")))) {
			System.out.println("bbbbb");
			if(!root1.equals("defaultValue")) {
				System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`");
				map.put("root1",root1);
			}
			else {
				System.out.println("#########################"+map.get("seq"));
				map.put("root1",map.get("seq"));
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!"+map.get("root1"));
			}
			if(!root.equals("defaultValue")) {
				map.put("root",root);
			}
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+root);
			List<Map<String,Object>> RElist = aDao.RErelist(map);
			
			mav.addObject("RElist",RElist);
			mav.setViewName("adoption/RErelist");
			
		}
		
		
	      return mav;
	   }*/
	
		
	

