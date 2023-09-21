package kr.co.drive.notice.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.drive.notice.domain.Notice;
import kr.co.drive.notice.service.NoticeService;
import kr.co.drive.notice.store.NoticeStore;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private SqlSession session;
	@Autowired
	private NoticeStore nStore;
	
	@Override
	public int insertNotice(Notice notice) {
		int result = nStore.insertNotice(session, notice);
		return result;
	}

	@Override
	public List<Notice> selectNoticeList(Notice notice) {
		List<Notice> nList = nStore.selectNoticeList(session, notice);
		return nList;
	}

	@Override
	public Notice selectNoticeByNo(Integer noticeNo) {
		Notice noticeOne = nStore.selectNoticeByNo(session, noticeNo);
		return noticeOne;
	}

	@Override
	public int updateNotice(Notice notice) {
		int result = nStore.updateNotice(session, notice);
		return result;
	}

	@Override
	public List<Notice> getAllNotices() {
		List<Notice> nList = nStore.getAllNotices(session);
		return nList;
	}


//	@Override
//	public int deleteNotice(Notice notice) {
//		int result = nStore.deleteNotice(session, notice);
//		return 0;
//	}

	@Override
	public int deleteNotice(Integer nNo) {
		int result = nStore.deleteNotice(session, nNo);
		return result;
	}
	
	

}
