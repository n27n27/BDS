package com.example.study.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.example.study.dto.NBoardDto;
import com.example.study.dto.RBoardDto;
import com.example.study.dto.RPageDto;
import com.example.study.dto.UserDto;

public interface IManagerService
{
	public int write(Map<String, String> map);	
	public int rCount();
	public List<RBoardDto> rList(int curPage);	
	public RBoardDto view(@Param("rnum")String rnum);
	public RPageDto articlePage(int curPage);
	public NBoardDto requestStyle();
	public List<UserDto> userList(int nPage);
	public List<NBoardDto> nList1(int nPage);
	public RPageDto articlePage1(int curPage);
}
