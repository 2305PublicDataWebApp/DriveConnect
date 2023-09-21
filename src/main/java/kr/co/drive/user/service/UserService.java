package kr.co.drive.user.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.drive.user.domain.User;

@Service
public interface UserService {
	
	/**
	 * 회원가입 Service
	 * @param user
	 * @return
	 */
	int insertUser(User user);

	/**
	 * 로그인 Service
	 * @param user
	 * @return
	 */
	User checkUserLogin(User user);

	List<User> selectUserList(User user);

	User selectUserByNo(Integer userNo);

	int updateUser(User user);

	int deleteUser(User user);

}