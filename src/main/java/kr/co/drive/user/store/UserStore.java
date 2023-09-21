package kr.co.drive.user.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.drive.user.domain.User;

public interface UserStore {

	int insertMember(SqlSession session, User user);

	User checkUserLogin(SqlSession session, User user);

	User getUserById(SqlSession session, String userId);

	int deleteUser(SqlSession session, String userId);

	int updateUser(SqlSession session, User user);

	int deleteUser(SqlSession session, User user);
	
	List<User> selectUserList(SqlSession session, User user);

	User selectUserByNo(SqlSession session, Integer userNo);	

}
