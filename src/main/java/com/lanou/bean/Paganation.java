package com.lanou.bean;

import java.util.List;

public class Paganation<E> {


    private Integer totalCount;

    private Integer pageSize;

    private Integer totalPage;

    private Integer currentPage;

    private List<E> data;

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalPage() {
        int totalPage = this.totalCount / this.pageSize;
        if(this.totalCount % this.pageSize != 0) {
            totalPage++;
        }
        return totalPage;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public List<E> getData() {
        return data;
    }

    public void setData(List<E> data) {
        this.data = data;
    }


}
