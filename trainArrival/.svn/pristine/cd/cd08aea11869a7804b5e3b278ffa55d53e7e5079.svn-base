package hansuo.trainArrival.page;

import java.io.Serializable;
import java.util.List;

public class Page<T> implements Serializable {

	private static final long serialVersionUID = -3016574274493681717L;

	// 每页显示的总条数
	public static final Integer PAGE_SIZE = 10;

	// 当前页
	private Integer currentPage = 1;
	// 总条数
	private Integer totalNum;
	// 是否有下一页
	private Integer isMore;
	// 总页数
	private Integer totalPage;
	// 开始索引
	private Integer startIndex;
	// 分页结果
	private List<T> items;

	public Page() {
		super();
	}

	public Page(Integer currentPage, Integer totalNum) {
		super();
		this.currentPage = currentPage;
		this.totalNum = totalNum;
		this.totalPage = (this.totalNum + PAGE_SIZE - 1) / PAGE_SIZE;
		this.startIndex = (this.currentPage - 1) * PAGE_SIZE;
		this.isMore = this.currentPage >= this.totalPage ? 0 : 1;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(Integer totalNum) {
		this.totalNum = totalNum;
	}

	public Integer getIsMore() {
		return isMore;
	}

	public void setIsMore(Integer isMore) {
		this.isMore = isMore;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(Integer startIndex) {
		this.startIndex = startIndex;
	}

	public List<T> getItems() {
		return items;
	}

	public void setItems(List<T> items) {
		this.items = items;
	}

}
