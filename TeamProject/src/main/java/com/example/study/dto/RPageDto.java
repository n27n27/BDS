package com.example.study.dto;

import lombok.Data;

@Data
public class RPageDto
{
	int totalCount;
	int listCount;
	int totalPage;
	int curPage;
	int pageCount;
	int startPage;
	int endPage;
}
