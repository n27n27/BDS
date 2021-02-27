package com.example.study.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.study.dto.SBoardDto;

@Mapper
public interface ISBoardDao
{
	public List<SBoardDto> sList();
	public int sWrite(Map<String, String> map);
	public int sHit(String snum);
	public SBoardDto sView(@Param("snum")String snum);	
	public int sDelete(@Param("snum")String snum);	
	public int sModify(Map<String, String> map);

}
