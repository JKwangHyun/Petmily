package aaa.bbb.ccc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import aaa.bbb.ccc.util.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService mDao ;
	
	@RequestMapping(value="/")
	public String home() {
		return "test1";
	}
}