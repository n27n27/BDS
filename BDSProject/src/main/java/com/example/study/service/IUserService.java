package com.example.study.service;

import java.util.Map;

import com.example.study.dto.UserDto;

public interface IUserService
{
	public int registerDAO(Map<String, String> map);
	public UserDto userinfo(String usrid);
	public int rpro1(String usrid);
	public int rpro2(String usrid);
	public int rpro3(String usrid);
	public int rpro4(String usrid);
	public int myinfoModify(Map<String, String> map);
}
