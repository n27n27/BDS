package com.example.study;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class rBoardDto
{
	private int rNum;
	private String rTitle;
	private String rContent;
	private String rName;
	private Timestamp rDate;
	private int Pwd;
	private int rSecret;
	private int rHit;
	private int rGroup;
	private int rStep;
	private int rIndent;
	private String rFRoot;
	private int rProcessing;
}
