package aaa.bbb.ccc.util;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

@Service
public class NoticeServieImple implements NoticeService {
	
	@Inject
	private SqlSession dao ;
	
	private static final String ns ="banana.apple.mapper.noticeMapper";

	@Override
	public int nInsert(Map<String, Object> map) {
		return dao.insert(ns+".noticeInsert",map);
	}

	@Override
	public int totalCount() {
		return dao.selectOne(ns+".totalCount");
	}

	@Override
	public List<Map<String, Object>> noticeList(Map<String, Object> map) {
		return dao.selectList(ns+".noticeList",map);
	}

	@Override
	public void countUp(Map<String, Object> map) {
		dao.update(ns+".countUp",map);
	}

	@Override
	public Map<String, Object> noticeDetail(Map<String, Object> map) {
		return dao.selectOne(ns+".noticeDetail",map);
	}

	@Override
	public void noticeUpdate(Map<String, Object> map) {
		dao.update(ns+".noticeUpdate",map);
	}

	@Override
	public void noticeDelete(Map<String, Object> map) {
		dao.delete(ns+".noticeDelete",map);
	}

}
