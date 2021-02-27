package com.example.study.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SBoardDto
{
	private String snum;
	private String usrid;
	private String stitle;	
	private String scontent;	
	private Timestamp sdate;	
	private int shit;
	
}
