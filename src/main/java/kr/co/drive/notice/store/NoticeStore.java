package kr.co.drive.notice.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.drive.notice.domain.Notice;

public interface NoticeStore {

	int insertNotice(SqlSession session, Notice notice);

	List<Notice> selectNoticeList(SqlSession session, Notice notice);

	Notice selectNoticeByNo(SqlSession session, Integer noticeNo);

	int updateNotice(SqlSession session, Notice notice);

	List<Notice> getAllNotices(SqlSession session);

	int deleteNotice(SqlSession session, Integer nNo);

}
