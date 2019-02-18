package aaa.bbb.ccc.util;

import aaa.bbb.ccc.vo.MemberVO;

public interface MemberService {

	MemberVO idcheck(MemberVO mvo);

	int memberInsert(MemberVO mvo);

	MemberVO memberDetail(MemberVO mvo);

	int memberDelete(MemberVO mvo);

	int memberUpdate(MemberVO mvo);

	int imgUpdate(MemberVO mvo);
}