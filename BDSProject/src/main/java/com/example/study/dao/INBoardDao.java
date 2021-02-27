package com.example.study.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.study.dto.NBoardDto;

@Mapper
public interface INBoardDao
{
	public List<NBoardDto> nList();
	public int upHit(String nnum);
	public NBoardDto view(@Param("nnum")String nnum);
	public int write(Map<String, String> map);
	public NBoardDto requestStyle();
	public List<NBoardDto> nList1(int nStart, int nEnd);
	public int articleCount(int curPage);
}
