package com.example.study.service;

import java.util.List;
import java.util.Map;

import com.example.study.dto.SBoardDto;

public interface ISBoardService
{
	public List<SBoardDto> sList();
	public int sWrite(Map<String, String> map);
	public int sHit(String snum);
	public SBoardDto sView(String snum);
	public int sDelete(String snum);
	public int sModify(Map<String, String> map);
}
