package kr.co.drive.admin.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class AdminNotice {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String userId;
    private String userName;
    private String userPhone;
    private String dLicense;

    // 관계 설정 등 필요한 필드 추가

    public AdminNotice() {
    }

    public AdminNotice(String userId, String userName, String userPhone, String dLicense) {
        this.userId = userId;
        this.userName = userName;
        this.userPhone = userPhone;
        this.dLicense = dLicense;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getdLicense() {
        return dLicense;
    }

    public void setdLicense(String dLicense) {
        this.dLicense = dLicense;
    }

    // 관계 설정 및 다른 필요한 Getter와 Setter 메서드 추가
}