package com.example.study.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.study.dto.RBoardDto;

@Mapper
public interface iRBoardDao
{	
	//삭제(확실히), 변경(modify), 답글모양(replyShape), 답글뷰(reply_view),답글(reply), 조회수(uphit), 페이징
	public List<RBoardDto> list();
	public RBoardDto view(@Param("rnum")String rnum);
	public int write(Map<String, String> map);
	public int delete(@Param("rnum")String rnum);
	public int articleCount();
	public int upHit(String rnum);
	public int modify(Map<String, String> map);
	public int reply(String rtitle, String rcontent, int rgroup, int rstep, int rindent, String rpwd, String rsecret);
}
