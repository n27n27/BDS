package com.example.study.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.study.dto.RBoardDto;

@Mapper
public interface IRBoardDao
{		
	public List<RBoardDto> list(int nStart, int nEnd);
	public RBoardDto view(@Param("rnum")String rnum);
	public int write(Map<String, String> map);
	public int delete(@Param("rnum")String rnum);	
	public int upHit(String rnum);
	public int modify(Map<String, String> map);
	public int reply(String rtitle, String rcontent, int rgroup, int rstep, int rindent, String rname);
	public int articlePage(int curPage);
	public int check(int rprocessing, String rnum);	
	public int rCount();
	public List<RBoardDto> rList(int nStart, int nEnd);
	public int articleCount(int curPage);	
}
