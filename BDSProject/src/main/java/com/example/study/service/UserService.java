package com.example.study.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.study.dao.IUserDao;
import com.example.study.dto.UserDto;

@Service
public class UserService implements IUserService
{
	@Autowired
	IUserDao iDao;
	
	@Override
	public int registerDAO(Map<String, String> map)
	{
		return iDao.registerDAO(map);
	}
	
	@Override
	public UserDto userinfo(String usrid)
	{
		return iDao.userinfo(usrid);
	}
	
	@Override
	public int rpro1(String usrid)
	{
		return iDao.rpro1(usrid);
	}

	@Override
	public int rpro2(String usrid)
	{
		return iDao.rpro2(usrid);
	}
	
	@Override
	public int rpro3(String usrid)
	{
		return iDao.rpro3(usrid);
	}
	
	@Override
	public int rpro4(String usrid)
	{
		return iDao.rpro4(usrid);
	}
	
	@Override
	public int myinfoModify(Map<String, String> map)
	{
		int mResult = iDao.myinfoModify(map);
		return mResult;
	}
}
