package com.example.study.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.study.dto.RBoardDto;

@Mapper
public interface iRBoardDao
{
	public List<RBoardDto> list();
	public RBoardDto view(@Param("rnum")String rnum);
	public int write(Map<String, String> map);
	public int delete(@Param("rnum")String rnum);
	public int articleCount();
	public void upHit(String rnum);
	
}
