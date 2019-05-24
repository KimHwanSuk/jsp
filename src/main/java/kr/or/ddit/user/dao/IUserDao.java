package kr.or.ddit.user.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.user.model.UserVO;

public interface IUserDao {

	
	/**
	 * 
	* Method : userList
	* 작성자 : PC14
	* 변경이력 :
	* @return
	* Method 설명 : 사용자 전체 조회
	 */
	public List<UserVO> userList();
	
	/**
	 * 
	* Method : getUser
	* 작성자 : PC14
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 사용자 정보 조회
	 */
	public UserVO getUser(String userId);
	
}