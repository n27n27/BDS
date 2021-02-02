package com.example.study.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.study.dao.iRBoardDao;
import com.example.study.dto.RBoardDto;

@Service
public class TeamProjectService implements ITeamProjectService
{
	@Autowired
	iRBoardDao dao;

	@Override
	public List<RBoardDto> list()
	{
		return dao.list();
	}

	@Override
	public RBoardDto view(String rnum)
	{
		return dao.view(rnum);
	}

	@Override
	public int write(Map<String, String> map)
	{	
		int nResult = dao.write(map); 
		return nResult;
	}

	@Override
	public int delete(String rnum)
	{
		int nResult = dao.delete(rnum);
		return nResult;
	}

	@Override
	public int articleCount()
	{
		int totalCount = dao.articleCount();
		return totalCount;
	}

}
