package com.example.study.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.study.dao.INBoardDao;
import com.example.study.dao.IRBoardDao;
import com.example.study.dao.IUserDao;
import com.example.study.dto.NBoardDto;
import com.example.study.dto.RBoardDto;
import com.example.study.dto.RPageDto;
import com.example.study.dto.UserDto;

@Service
public class ManagerService implements IManagerService
{
	@Autowired
	IRBoardDao dao;	
	
	@Autowired
	INBoardDao nDao;
	
	@Autowired
	IUserDao uDao;
	
	@Autowired
	RPageDto pdto;
	
	int listCount = 10;
	int pageCount = 10;
	
	@Override
	public List<UserDto> userList(int nPage)
	{
		int nStart = (nPage - 1) * listCount + 1;
		int nEnd = (nPage - 1) * listCount + listCount;
		return uDao.userList(nStart, nEnd);
	}
	
	@Override
	public List<NBoardDto> nList1(int nPage)
	{
		int nStart = (nPage - 1) * listCount + 1;
		int nEnd = (nPage - 1) * listCount + listCount;
		return nDao.nList1(nStart, nEnd);
	}
	@Override
	public int write(Map<String, String> map)
	{
		int nResult = nDao.write(map); 
		return nResult;
	}	
	
	@Override
	public NBoardDto requestStyle()
	{
		return nDao.requestStyle();
	}
	
	@Override
	public List<RBoardDto> rList(int curPage)
	{
		int nStart = (curPage - 1) * listCount + 1;
		int nEnd = (curPage - 1) * listCount + listCount;
		return dao.rList(nStart, nEnd);
	}
	
	@Override
	public int rCount()
	{
		return dao.rCount();
	}
	
	@Override
	public RBoardDto view(@Param("rnum")String rnum)
	{
		return dao.view(rnum);
	}
	
	@Override
	public RPageDto articlePage1(int curPage)
	{			
		int totalCount = nDao.articleCount(curPage);
		
		int totalPage = totalCount / listCount;
		if(totalCount % listCount > 0)
			totalPage ++;
		
		int myCurPage = curPage;
		if(myCurPage > totalPage)
			myCurPage = totalPage;
		if(myCurPage < 1)
			myCurPage = 1;
		
		int startPage = ((myCurPage - 1) / pageCount) * pageCount + 1;
		
		int endPage = startPage + pageCount - 1;
		if(endPage > totalPage)
			endPage = totalPage;
		 
		pdto.setTotalCount(totalCount);
		
		pdto.setListCount(listCount);
		pdto.setTotalPage(totalPage);
		pdto.setCurPage(curPage);
		pdto.setPageCount(pageCount);
		pdto.setStartPage(startPage);
		pdto.setEndPage(endPage);
		
		return pdto;
	}
	
	@Override
	public RPageDto articlePage(int curPage)
	{			
		int totalCount = dao.rCount();
		
		int totalPage = totalCount / listCount;
		if(totalCount % listCount > 0)
			totalPage ++;
		
		int myCurPage = curPage;
		if(myCurPage > totalPage)
			myCurPage = totalPage;
		if(myCurPage < 1)
			myCurPage = 1;
		
		int startPage = ((myCurPage - 1) / pageCount) * pageCount + 1;
		
		int endPage = startPage + pageCount - 1;
		if(endPage > totalPage)
			endPage = totalPage;
		 
		pdto.setTotalCount(totalCount);
		
		pdto.setListCount(listCount);
		pdto.setTotalPage(totalPage);
		pdto.setCurPage(curPage);
		pdto.setPageCount(pageCount);
		pdto.setStartPage(startPage);
		pdto.setEndPage(endPage);
		
		return pdto;
	}
}
