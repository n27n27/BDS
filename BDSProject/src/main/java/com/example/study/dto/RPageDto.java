package com.example.study.dto;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Repository
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
