package kr.co.drive.reserve.service;


import java.util.List;

import kr.co.drive.reserve.domain.Reserve;

public interface ReserveService {


	int insertReserve(Reserve reserve);

	List<Reserve> getList(int unum);

	int getmyTotalPrice(int unum);

	List<Reserve> getStoreNameList(String sarea);

}