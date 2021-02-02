package com.example.study.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class RBoardDto
{
	private String rnum;	
	@NotNull(message = "Title is null.")
	@NotEmpty(message = "Title is empty.")
	private String rtitle;
	@NotNull(message = "Content is null.")
	@NotEmpty(message = "Content is empty.")
	private String rcontent;
	private String rname;
	private Timestamp rdate;	
	private String rpwd;
	private int rsecret;
	private int rhit;
	private int rgroup;
	private int rstep;
	private int rindent;
	private String rfroot;
	private int rprocessing;
}
