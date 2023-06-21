CREATE SEQUENCE seq_board;

CREATE TABLE tbl_board (
  bno					NUMBER(10,0),
  title					VARCHAR2(200)				NOT NULL,
  content			VARCHAR2(2000)			NOT NULL,
  regdate			DATE									DEFAULT	SYSDATE, 
  updatedate	DATE									DEFAULT	SYSDATE,
  referrals			NUMBER(10,0)					NOT NULL,
  views				NUMBER(10,0)					NOT NULL,
  fixed				CHAR(1)								DEFAULT	'0';
);

ALTER TABLE tbl_board ADD CONSTRAINT pk_board PRIMARY KEY (bno);


CREATE TABLE tbl_backup_board(
  bno					NUMBER(10,0),
  title					VARCHAR2(200)				NOT NULL,
  content			VARCHAR2(2000)			NOT NULL,
  regdate			DATE									DEFAULT	SYSDATE, 
  updatedate	DATE									DEFAULT	SYSDATE,
  referrals			NUMBER(10,0)					NOT NULL,
  views				NUMBER(10,0)					NOT NULL
);

ALTER TABLE tbl_backup_board ADD CONSTRAINT pk_backup_board PRIMARY KEY (bno);


CREATE TABLE tbl_attach (
		uuid								varchar2(100)	,
		uploadPath					varchar2(200)	NOT NULL,
		fileName						varchar2(100)		NOT NULL,
		filetype							char(1)					DEFAULT 'I',
		bno									number(10, 0)
);

ALTER TABLE tbl_attach ADD CONSTRAINT pk_attach PRIMARY KEY (uuid);

ALTER TABLE tbl_attach ADD CONSTRAINT fk_board_attach FOREIGN KEY (bno) REFERENCES tbl_board(bno);

