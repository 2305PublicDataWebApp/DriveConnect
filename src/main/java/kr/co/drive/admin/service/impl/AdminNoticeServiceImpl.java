package kr.co.drive.admin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.drive.admin.repository.AdminNoticeRepository;
import kr.co.drive.admin.service.AdminNoticeService;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService {

	@Autowired
	private AdminNoticeRepository adminNoticeRepository;

    @Autowired
    public AdminNoticeServiceImpl(AdminNoticeRepository adminNoticeRepository) {
        this.adminNoticeRepository = adminNoticeRepository;
    }

    // 이제 여기에서 adminNoticeRepository를 사용하여 데이터베이스 작업 수행 가능
}
