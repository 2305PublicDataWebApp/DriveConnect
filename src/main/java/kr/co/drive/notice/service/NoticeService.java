package kr.co.drive.notice.service;

import java.util.List;

import kr.co.drive.notice.domain.Notice;

public interface NoticeService {

	int insertNotice(Notice notice);

	List<Notice> selectNoticeList(Notice notice);

	Notice selectNoticeByNo(Integer noticeNo);

	int updateNotice(Notice notice);

	List<Notice> getAllNotices();

	int deleteNotice(Integer nNo);

}
