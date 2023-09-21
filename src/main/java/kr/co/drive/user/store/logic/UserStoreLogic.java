package kr.co.drive.user.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.drive.user.domain.User;
import kr.co.drive.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore {
//	ljh
	@Override
	public int insertMember(SqlSession session, User user) {
		// TODO Auto-generated method stub
		int result = session.insert("UserMapper.insertUser", user);
		return result;
	}

	@Override
	public int deleteUser(SqlSession session, String userId) {
		// TODO Auto-generated method stub
		int result = session.delete("UserMapper.deleteUser", userId);
		return result;
	}
	
	@Override
	public User checkUserLogin(SqlSession session, User user) {
		// TODO Auto-generated method stub
		User uOne = session.selectOne("UserMapper.checkUserLogin", user);
		return uOne;
	}

	@Override
	public User getUserById(SqlSession session, String userId) {
		// TODO Auto-generated method stub
		User user = session.selectOne("UserMapper.getUserById", userId);
		return user;
	}
//	ogh
	@Override
	public int updateUser(SqlSession session, User user) {
		int result = session.update("UserMapper.updateUser", user);
		return result;
	}
	
	@Override
	public List<User> selectUserList(SqlSession session, User user) {
		List<User> uList = session.selectList("UserMapper.selectUserList", user);
		return uList;
	}

	@Override
	public User selectUserByNo(SqlSession session, Integer userNo) {
		User userOne = session.selectOne("UserMapper.selectUserByNo", userNo);
		return userOne;
	}


	@Override
	public int deleteUser(SqlSession session, User user) {
		int result = session.delete("UserMapper.deleteUser", user);
		return result;
	}


}
