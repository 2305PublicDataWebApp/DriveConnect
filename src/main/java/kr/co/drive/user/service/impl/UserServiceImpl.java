package kr.co.drive.user.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.drive.notice.domain.Notice;
import kr.co.drive.user.domain.User;
import kr.co.drive.user.service.UserService;
import kr.co.drive.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private SqlSession session;
	
	@Autowired
	private UserStore uStore;
	
	@Override
	public int insertUser(User user) {
		// TODO Auto-generated method stub
		int result = uStore.insertMember(session, user);
		return result;
	}

	@Override
	public User checkUserLogin(User user) {
		// TODO Auto-generated method stub
		User uOne = uStore.checkUserLogin(session, user);
		return uOne;
	}

	@Override
	public List<User> selectUserList(User user) {
		List<User> uList = uStore.selectUserList(session, user);
		return uList;
	}

	@Override
	public User selectUserByNo(Integer userNo) {
		User userOne = uStore.selectUserByNo(session, userNo);
		return userOne;
	}

	@Override
	public int updateUser(User user) {
		int result = uStore.updateUser(session, user);
		return result;
	}


	@Override
	public int deleteUser(User user) {
		int result = uStore.deleteUser(session, user);
		return result;
	}

}