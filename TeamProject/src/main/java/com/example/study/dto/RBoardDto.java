package com.example.study.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

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
	@NotNull(message = "passwrod is null.")
	@NotEmpty(message = "passwrod is empty.")
	@Size(max=4, message = "password is less than 5.")
	private String rsecret;
	private int rhit;
	private int rgroup;
	private int rstep;
	private int rindent;
	private String rfroot;
	private int rprocessing;
}
