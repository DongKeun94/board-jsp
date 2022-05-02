# 1. JSP 와 Oracle DB 를 이용한 게시판


--- 기본 설계 ----------------------------

게시글 정보를 담을 수 있는 클래스 정의
 - BoardVo.java  => BoardDto.java 라고도 많이 사용 중임 ( 데이터를 전송할때 사용하는 객체 )
( 게시글 하나의 정보를 담을 수 있음 -> 아래 기재된 쿼리문에 맞춰서 클래스를 정의 하면 됨 )

데이터베이스에 접근하는 클래스 정의
- BoardDao.java ==> 아래 쿼리문(CRUD)을 전송하기 위한 기능을 가짐

JSP파일(/board/)
- 메인페이지(index.jsp) :  게시판 링크 ( 목록 요청 )
- 게시글 목록 ( list.jsp) : 글쓰기 링크
- 게시글 등록  
	입력폼 응답 ( registForm.jsp)
	데이터베이스에 등록 후 list.jsp 로 리다이렉트 ( regist.jsp ) 
- 게시글 보기 ( boardDetail.jsp?num=10)
	데이터베이스에서 해당 num 게시글을 찾아 브라우저에 응답
- 게시글 수정
	입력폼 응답 ( editForm.jsp?num=10 ) : 해당 num 게시글 변경 전 내용 필요
	데이터베이스에 수정 후 boardDetail.jsp 리다이렉트 ( edit.jsp?num=10 ) 
- 게시글 삭제
	게시글 삭제 확인 ( deleteForm.jsp?num=10 ) : 삭제 확인, 취소
	데이터베이스에서 삭제 후 list.jsp로 리다이렉트 ( delete.jsp?num=10 )

------------------ 기본 설계 끝 ----------------------------------


사용한 SQL 쿼리문

# 삽입
INSERT INTO BOARD (NUM,TITLE,WRITER,CONTENT,REGDATE,CNT)
VALUES (BOARD_SEQ.nextval, '제목1', '작성자1','내용1',SYSDATE,0);

# 조회
SELECT * FROM BOARD;
SELECT * FROM BOARD WHRER NUM =  ? ;

# 수정
UPDATE BOARD SET TITLE='제목수정',CONTENT='내용수정' WHERE NUM=1;

# 삭제
DELETE FROM BOARD WHERE NUM=1;
