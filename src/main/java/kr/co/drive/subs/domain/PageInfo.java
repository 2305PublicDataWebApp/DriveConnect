package kr.co.drive.subs.domain;

public class PageInfo {

	private int currentPage;
	private int totalCount;
	private int naviTotalCount;  //(고정값)100게시물을 20개씩 표시하면 총 5페이지(이게naviTotalCount!!) 
	private int recordCountPerPage; //(고정값) 6게시물을 5개씩 표시하면 2페이지에 6번게시물만 표시될것. 여기서 6번게시물만 표시되는 잔여페이지를 recordCountPerPage
	private int naviCountPerPage;
	private int startNavi;
	private int endNavi;
	
	public PageInfo() {
		
	}

	public PageInfo(int currentPage, int totalCount, int naviTotalCount, int recordCountPerPage, int naviCountPerPage,
			int startNavi, int endNavi) {
		super();
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.naviTotalCount = naviTotalCount;
		this.recordCountPerPage = recordCountPerPage;
		this.naviCountPerPage = naviCountPerPage;
		this.startNavi = startNavi;
		this.endNavi = endNavi;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getNaviTotalCount() {
		return naviTotalCount;
	}

	public void setNaviTotalCount(int naviTotalCount) {
		this.naviTotalCount = naviTotalCount;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getNaviCountPerPage() {
		return naviCountPerPage;
	}

	public void setNaviCountPerPage(int naviCountPerPage) {
		this.naviCountPerPage = naviCountPerPage;
	}

	public int getStartNavi() {
		return startNavi;
	}

	public void setStartNavi(int startNavi) {
		this.startNavi = startNavi;
	}

	public int getEndNavi() {
		return endNavi;
	}

	public void setEndNavi(int endNavi) {
		this.endNavi = endNavi;
	}

	@Override
	public String toString() {
		return "PageInfo [현재페이지=" + currentPage + ", 총게시물갯수=" + totalCount + ", 네비총갯수="
				+ naviTotalCount + ", 한페이지당 게시물갯수=" + recordCountPerPage + ", 한페이지당 네비갯수="
				+ naviCountPerPage + ", 시작네비=" + startNavi + ", 종료네비=" + endNavi + "]";
	}
}
