package com.example.study.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.example.study.dto.RBoardDto;

public interface ITeamProjectService
{
	public List<RBoardDto> list();
	public RBoardDto view(@Param("rnum")String rnum);
	public int write(Map<String, String> map);
	public int delete(@Param("rnum")String rnum);
	public int articleCount();
	public int modify(Map<String, String> map);	
	public int upHit(String rnum);
	public int reply(String rtitle, String rcontent, int rgroup, int rstep, int rindent, String rpwd, String rsecret);
}
