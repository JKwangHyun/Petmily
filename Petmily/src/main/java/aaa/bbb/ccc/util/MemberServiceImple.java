package aaa.bbb.ccc.util;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImple implements MemberService {

	@Inject
	private SqlSession mDAO ;
	
	private static final String ns ="banana.apple.mapper.memberMapper";
	
}
