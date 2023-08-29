-- member는 vo 폴더에 DBSetup 실행하기(암호화 때문임)
-- 복호화 된 아이디: admin , 비번: 1234 // INSERT INTO MEMBER VALUES("admin","x6lU/AwMminTiWvJQLjQhBMveBm+Ko2Ycs5rNmY4B/1PmhAIItVH33tH2sEzSuYLyBh4Yw==","관리자","sendjin@naver.com","010-1111-2222","1999-01-01","마리오 아울렛 2관","11111",DEFAULT,DEFAULT,DEFAULT );
-- qna 더미 데이터

-- faq 더미 데이터

-- 공지 테이블
INSERT INTO notice(title, content) VALUES("공지1", "공지1의 내용입니다");
INSERT INTO notice(title, content) VALUES("공지2", "공지2의 내용입니다");

-- 카테고리 테이블
INSERT INTO category(categoryId, categoryName) VALUES("A", "초등교과서");
INSERT INTO category(categoryId, categoryName) VALUES("B", "초등참고서");
INSERT INTO category(categoryId, categoryName) VALUES("C", "초등문제집");
INSERT INTO category(categoryId, categoryName) VALUES("D", "초등기타");

INSERT INTO category(categoryId, categoryName) VALUES("E", "중등교과서");
INSERT INTO category(categoryId, categoryName) VALUES("F", "중등참고서");
INSERT INTO category(categoryId, categoryName) VALUES("G", "중등문제집");
INSERT INTO category(categoryId, categoryName) VALUES("H", "중등기타");

INSERT INTO category(categoryId, categoryName) VALUES("I", "고등교과서");
INSERT INTO category(categoryId, categoryName) VALUES("J", "고등참고서");
INSERT INTO category(categoryId, categoryName) VALUES("K", "고등문제집");
INSERT INTO category(categoryId, categoryName) VALUES("L", "고등기타");

-- product 상품
INSERT INTO product(categoryId, price, title, DESCRIPTION, content, img) VALUES("B", 14500, "수학리더 개념 1-1 (2024)", "수학리더 시리즈 연산, 개념, 기본, 기본+응용, 응용·심화 중에서 교과서 개념을 익히는 가장 쉬운 단계의 첫단계 개념서이다.", "개념을 이해하는 쉽게 기초력, 이해력 문제들과 연산드릴 문제도 함께 수록하여 방학 때 다음 학기 내용을 미리 학습하기 좋은 선행 교재이다.", "초등교과서_수학리더 개념 1-1 (2024)");
INSERT INTO product(categoryId, price, title, DESCRIPTION, content, img) VALUES("A", 15000, "초등국어책", "초등국어책에 대한 간단한 설명", "초등국어책 많은 내용","끝맽음입니다.");
INSERT INTO product(categoryId, price, title, DESCRIPTION, content, img) VALUES("E", 20000, "중등국어책", "중등국어책에 대한 간단한 설명", "중등국어책 많은 내용","끝맽음입니다.");
INSERT INTO product(categoryId, price, title, DESCRIPTION, content, img) VALUES("I", 15000, "고등국어책", "고등국어책에 대한 간단한 설명", "고등국어책 많은 내용","끝맽음입니다.");
INSERT INTO product(categoryId, price, title, DESCRIPTION, content, img) VALUES("M", 20000, "일반교과서책", "일반교과서책에 대한 간단한 설명", "일반교과서책 많은 내용","끝맽음입니다.");
INSERT INTO product(categoryId, price, title, DESCRIPTION, content, img) VALUES("P", 25000, "일반기타책", "일반기타책에 대한 간단한 설명", "일반기타책 많은 내용","끝맽음입니다.");


--book 상품
INSERT INTO book VALUES(1, DEFAULT, "삼성", "교진","타이틀1","콘텐츠 입니다.1",DEFAULT,DEFAULT);
INSERT INTO book VALUES(2, DEFAULT, "엘지", "상민","타이틀2","콘텐츠 입니다.2",DEFAULT,DEFAULT);
INSERT INTO book VALUES(3, DEFAULT, "구글", "슬비","타이틀3","콘텐츠 입니다.3",DEFAULT,DEFAULT);
INSERT INTO book VALUES(4, DEFAULT, "애플", "이호","타이틀4","콘텐츠 입니다.4",DEFAULT,DEFAULT);
INSERT INTO book VALUES(5, DEFAULT, "카카오", "나연","타이틀5","콘텐츠 입니다.5",DEFAULT,DEFAULT);
INSERT INTO book VALUES(6, DEFAULT, "네이버", "소윤","타이틀6","콘텐츠 입니다.6",DEFAULT,DEFAULT);

-- 입고
INSERT INTO instock(proNo, amount, inPrice) values(1, 10, 10000);

-- 출고
INSERT INTO outstock(proNo, amount, outPrice) VALUES(1, 5, 14500);

-- 배송

-- 결제

-- 카트
INSERT INTO cart(memId, proNo, amount, price) VALUES("kim1", 1, 2,3000);

