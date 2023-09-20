package kr.co.drive.admin.repository;

import kr.co.drive.admin.domain.AdminNotice;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminNoticeRepository extends CrudRepository<AdminNotice, Long> {
    // 추가적인 메서드 정의 가능
}
