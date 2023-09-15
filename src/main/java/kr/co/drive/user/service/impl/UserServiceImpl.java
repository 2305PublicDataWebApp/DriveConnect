package kr.co.drive.user.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
