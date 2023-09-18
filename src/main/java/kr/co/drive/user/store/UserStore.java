package kr.co.drive.user.store;

import org.apache.ibatis.session.SqlSession;

import kr.co.drive.user.domain.User;

public interface UserStore {

	int insertMember(SqlSession session, User user);

	User checkUserLogin(SqlSession session, User user);

	User getUserById(SqlSession session, String userId);

	int deleteUser(SqlSession session, String userId);

	int updateUser(SqlSession session, User user);



}
