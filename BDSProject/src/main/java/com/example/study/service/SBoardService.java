package com.example.study.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.study.dao.ISBoardDao;
import com.example.study.dto.SBoardDto;

@Service
public class SBoardService implements ISBoardService
{
	@Autowired
	ISBoardDao sDao;
	
	@Override
	public List<SBoardDto> sList()
	{
		return sDao.sList();
	}

	@Override
	public int sWrite(Map<String, String> map)
	{		
		return sDao.sWrite(map);
	}

	@Override
	public int sHit(String snum)
	{
		return sDao.sHit(snum);
	}
	
	@Override
	public SBoardDto sView(String snum)
	{
		return sDao.sView(snum);
	}
	
	@Override
	public int sDelete(String snum)
	{
		return sDao.sDelete(snum);
	}
	
	@Override
	public int sModify(Map<String, String> map)
	{
		return sDao.sModify(map);
	}
}
