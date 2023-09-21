package kr.co.drive.often.service;

import java.util.List;

import kr.co.drive.often.domain.Often;

public interface OftenService {

	int insertOften(Often often);

	List<Often> selectOftenList(Often often);

	Often selectOftenByNo(Integer oNo);

	int updateOften(Often often);

	int deleteOften(Integer oNo);

}
