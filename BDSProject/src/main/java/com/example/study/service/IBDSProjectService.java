package com.example.study.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;

import com.example.study.dto.RBoardDto;
import com.example.study.dto.RPageDto;

public interface IBDSProjectService
{
	public List<RBoardDto> list(int curPage);
	public RBoardDto view(@Param("rnum")String rnum);
	public int write(Map<String, String> map);
	public int delete(@Param("rnum")String rnum);	
	public int modify(Map<String, String> map);	
	public int upHit(String rnum);
	public int reply(String rtitle, String rcontent, int rgroup, int rstep, int rindent, String rpwd, String rsecret);
	public RPageDto articlePage(int curPage);
	public int check(int rprocessing, String rnum);
}
