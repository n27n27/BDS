package com.example.study.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.study.dto.UserDto;

@Mapper
public interface IUserDao
{
	public int registerDAO(Map<String, String> map);
	public UserDto userinfo(String usrid);
	public List<UserDto> userList(int nStart, int nEnd);
	public int rpro1(@Param("usrid")String usrid);
	public int rpro2(@Param("usrid")String usrid);
	public int rpro3(@Param("usrid")String usrid);
	public int rpro4(@Param("usrid")String usrid);	
	public int myinfoModify(Map<String, String> map);
}
