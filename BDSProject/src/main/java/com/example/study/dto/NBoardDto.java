package com.example.study.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NBoardDto
{
	private String nnum;
	private String ntitle;
	private String ncontent;
	private String nname;
	private Timestamp ndate;
	private int nhit;
	private String nfroot;
}
