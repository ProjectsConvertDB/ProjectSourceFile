package org.momento.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

	private Long bno;
	private String tltle;
	private String content;
	private Date regDate;
	private Date updateDate;
	private Long referrals;
	private Long views;
	
	private List<BoardAttachVO> attachList;
	
}