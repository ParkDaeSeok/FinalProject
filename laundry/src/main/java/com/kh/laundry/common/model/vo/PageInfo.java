package com.kh.laundry.common.model.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PageInfo {

	private int totalCount; // 현재 일반게시판의 게시글 총 갯수 => hotel 로부터 조회 COUNT(*) 활용 (STATUS='Y')
	private int currentPage; // 현재페이지 (즉, 사용자가 요청한 페이지)
	private int pageLimit; // 페이지하단에 보여질 페이징바의 페이지 최대 갯수 => 10개로 고정
	private int listLimit; // 한 페이지에 보여질 게시글의 최대 갯수 => 개로 고정
	private int maxPage; // 가장 마지막 페이지가 몇번 페이지인지 (== 총 페이지의 갯수)
	private int startPage; // 페이지 하단에 보여질 페이징바의 시작수
	private int endPage; // 페이지 하단에 보여질 페이징바의 마지막수
	
}
