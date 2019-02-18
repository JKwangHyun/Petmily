package aaa.bbb.ccc.util;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	int nInsert(Map<String, Object> map);

	int totalCount();

	List<Map<String, Object>> noticeList(Map<String, Object> map);

	void countUp(Map<String, Object> map);

	Map<String, Object> noticeDetail(Map<String, Object> map);

	void noticeUpdate(Map<String, Object> map);

	void noticeDelete(Map<String, Object> map);

}
