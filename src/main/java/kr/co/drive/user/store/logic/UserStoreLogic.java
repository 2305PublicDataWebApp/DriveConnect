package kr.co.drive.user.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.drive.user.domain.User;
import kr.co.drive.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore {

	@Override
	public int insertMember(SqlSession session, User user) {
		// TODO Auto-generated method stub
		int result = session.insert("UserMapper.insertUser", user);
		return result;
	}

}
