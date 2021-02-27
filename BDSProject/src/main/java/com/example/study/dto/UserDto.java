package com.example.study.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserDto
{
	private int usrnum;
	private String usrid;
	private String usrpw;
	private String usrname;
	private String usrpnum;
	private String usraddr;
	private String usremail;
	private String usrauth;
	private int enabled;
	private Timestamp usrdate;
}
