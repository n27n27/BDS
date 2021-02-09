package com.example.study.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.study.dao.iRBoardDao;
import com.example.study.dto.RBoardDto;
import com.example.study.dto.RPageDto;

@Service
public class BDSProjectService implements IBDSProjectService
{
	@Autowired
	iRBoardDao dao;	
	
	@Autowired
	RPageDto pdto;
	
	int listCount = 15;
	int pageCount = 10;

	@Override
	public List<RBoardDto> list(int curPage)
	{		
		int nStart = (curPage - 1) * listCount + 1;
		int nEnd = (curPage - 1) * listCount + listCount;		
		return dao.list(nStart, nEnd);
	}
	
	@Override
	public int check(int rprocessing, String rnum)
	{
		int nResult = dao.check(rprocessing, rnum);
		return nResult;
	}
	
	@Override
	public int upHit(String rnum)
	{
		int nResult = dao.upHit(rnum);
		return nResult;
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
	public int reply(String rtitle, String rcontent, int rgroup, int rstep, int rindent, String rpwd, String rsecret)
	{
		System.out.println("여기2");
		int nResult = dao.reply(rtitle, rcontent, rgroup, rstep, rindent, rpwd, rsecret);
		return nResult;
	}
	
	@Override
	public int modify(Map<String, String> map)
	{
		int nResult = dao.modify(map);
		return nResult;
	}
	
	@Override
	public RPageDto articlePage(int curPage)
	{			
		int totalCount = dao.articlePage(curPage);
		
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
		System.out.println(totalCount); 
		pdto.setTotalCount(totalCount);
		System.out.println(pdto.getTotalCount());
		pdto.setListCount(listCount);
		pdto.setTotalPage(totalPage);
		pdto.setCurPage(curPage);
		pdto.setPageCount(pageCount);
		pdto.setStartPage(startPage);
		pdto.setEndPage(endPage);
		
		return pdto;
	}
	
	@Override
	public int delete(String rnum)
	{
		int nResult = dao.delete(rnum);
		return nResult;
	}	

}
