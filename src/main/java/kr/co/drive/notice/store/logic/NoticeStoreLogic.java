package kr.co.drive.notice.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.drive.notice.domain.Notice;
import kr.co.drive.notice.store.NoticeStore;

@Repository
public class NoticeStoreLogic implements NoticeStore{

	@Override
	public int insertNotice(SqlSession session, Notice notice) {
		int result = session.insert("NoticeMapper.insertNotice", notice);
		return result;
	}

	@Override
	public List<Notice> selectNoticeList(SqlSession session, Notice notice) {
		List<Notice> nList = session.selectList("NoticeMapper.selectNoticeList", notice);
		return nList;
	}

	@Override
	public Notice selectNoticeByNo(SqlSession session, Integer noticeNo) {
		Notice noticeOne = session.selectOne("NoticeMapper.selectNoticeByNo", noticeNo);
		return noticeOne;
	}

	@Override
	public int updateNotice(SqlSession session, Notice notice) {
		int result = session.update("NoticeMapper.updateNotice", notice);
		return result;
	}

	@Override
	public List<Notice> getAllNotices(SqlSession session) {
		List<Notice> nList = session.selectList("NoticeMapper.getAllNotices");
		return nList;
	}


//	@Override
//	public int deleteNotice(SqlSession session, Notice notice) {
//		int result = session.delete("NoticeMapper.deleteNotice", notice);
//		return result;
//	}

	@Override
	public int deleteNotice(SqlSession session, Integer nNo) {
		int result = session.delete("NoticeMapper.deleteNotice", nNo);
		return result;
	}

}
