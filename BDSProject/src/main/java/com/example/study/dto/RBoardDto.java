package com.example.study.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RBoardDto
{
	private String rnum;	
	private String rtitle;	
	private String rcontent;
	private String rname;
	private Timestamp rdate;	
	private String rpwd;	
	private String rsecret;
	private int rhit;
	private int rgroup;
	private int rstep;
	private int rindent;
	private String rfroot;
	private int rprocessing;
}
