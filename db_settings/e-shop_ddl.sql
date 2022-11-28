﻿CREATE TABLE `TB_MEMBER` (
	`USER_NO`	BIGINT	NOT NULL	AUTO_INCREMENT  PRIMARY KEY COMMENT '유저번호',
	`USER_ID`	VARCHAR(30)	NOT NULL	COMMENT '아이디',
	`NAME`	VARCHAR(30)	NOT NULL	COMMENT '이름',
	`JOIN_CD`	CHAR(2)	NOT NULL	COMMENT '가입수단 코드',
	`STATUS`	CHAR(2)	NOT NULL	COMMENT '상태코드',
	`PASSWORD`	VARCHAR(200)	NOT NULL	COMMENT '비밀번호',
	`TEL`	VARCHAR(11)	NOT NULL	COMMENT '전화번호',
	`POST_NUM`	CHAR(6)	NOT NULL	COMMENT '우편번호',
	`ADDRESS`	VARCHAR(100)	NOT NULL	COMMENT '주소',
	`NOTI_YN`	CHAR(1)	NOT NULL	DEFAULT 'N'	COMMENT '알람수신 동의여부',
	`NOTI_AGREE_DT`	DATETIME	NULL	COMMENT '알람수신 동의일',
	`LAST_LOGIN_DT`	DATETIME	NOT NULL	COMMENT '마지막 로그인 일시',
	`MODIFY_PW_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '비밀번호 변경일시',
	`REG_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '등록일시',
	`UPD_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '수정일시'
);

CREATE TABLE `TB_ITEM` (
	`ITEM_NO`	BIGINT	NOT NULL	AUTO_INCREMENT  PRIMARY KEY COMMENT '상품번호',
	`NAME`	VARCHAR(100)	NOT NULL	COMMENT '상품명',
	`STATUS`	CHAR(2)	NULL	COMMENT '상태코드',
	`REMAINS`	BIGINT	NOT NULL	COMMENT '재고',
	`PRICE`	BIGINT	NOT NULL	COMMENT '가격',
	`INTRO`	VARCHAR(300)	NULL	COMMENT '소개글',
	`BIG_IMAGE`	VARCHAR(200)	NULL	COMMENT '상품 이미지(대형)',
	`SMALL_IMAGE`	VARCHAR(200)	NULL	COMMENT '상품 이미지(소형)',
	`SELL_CNT`	BIGINT	NOT NULL	DEFAULT 0	COMMENT '판매량',
	`LIKES`	BIGINT	NOT NULL	DEFAULT 0	COMMENT '찜하기 총 수',
	`CONTENT`	VARCHAR(1000)	NULL	COMMENT '상품 상세',
	`AD_YN`	CHAR(1)	NOT NULL	DEFAULT 'N'	COMMENT '광고 노출 상품 여부',
	`MD_RECOMMEND_YN`	CHAR(1)	NOT NULL	DEFAULT 'N'	COMMENT 'MD 추천 상품 여부',
	`FAST_YN`	CHAR(1)	NOT NULL	DEFAULT 'N'	COMMENT '빠른배송 상품 여부',
	`REG_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '등록일시',
	`UPD_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '수정일시',
	`CATEGORY_NO`	BIGINT	NOT NULL,
	`ADMIN_NO`	BIGINT	NOT NULL	COMMENT '어드민 번호'
);

CREATE TABLE `TB_LIKE` (
	`USER_NO`	BIGINT	NOT NULL	COMMENT '유저번호',
	`ITEM_NO`	BIGINT	NOT NULL	COMMENT '상품번호',
	`REG_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '등록일시',
	`UPD_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '수정일시'
);

CREATE TABLE `TB_ORDER` (
	`ORDER_NO`	BIGINT	NOT NULL	AUTO_INCREMENT  PRIMARY KEY COMMENT '주문번호',
	`USER_NO`	BIGINT	NOT NULL	COMMENT '유저번호',
	`STATUS`	CHAR(2)	NOT NULL	COMMENT '상태코드',
	`PAID_YN`	CHAR(1)	NOT NULL	DEFAULT 'N'	COMMENT '결제여부',
	`PAY_DT`	DATETIME	NULL	COMMENT '결제일',
	`PAY_METHOD_CD`	CHAR(2)	NOT NULL	COMMENT '결제수단코드',
	`PRICE`	BIGINT	NOT NULL	COMMENT '지불가격',
	`COUPON_NO`	BIGINT	NOT NULL	COMMENT '쿠폰번호',
	`DELIVERY_FEE`	BIGINT	NOT NULL	COMMENT '배송비',
	`TOTAL_PRICE`	BIGINT	NOT NULL	COMMENT '결제총액',
	`POST_NUM`	CHAR(6)	NOT NULL	COMMENT '우편번호',
	`ADDRESS`	VARCHAR(100)	NOT NULL	COMMENT '배송주소',
	`NOTES`	VARCHAR(100)	NULL	COMMENT '배송 요청사항',
	`DELIVERY_START_DT`	DATETIME	NOT NULL	COMMENT '배송 시작 예정일자',
	`DELIVERY_END_DT`	DATETIME	NULL	COMMENT '배송 완료일자',
	`CANCEL_YN`	CHAR(1)	NOT NULL	DEFAULT 'N'	COMMENT '취소 여부',
	`CANCEL_DT`	DATETIME	NULL	COMMENT '취소일자',
	`CANCEL_DESC`	VARCHAR(200)	NULL	COMMENT '취소사유',
	`REFUND_YN`	CHAR(1)	NOT NULL	DEFAULT 'N'	COMMENT '환불여부',
	`REFUND_DT`	DATETIME	NULL	COMMENT '환불 완료일자',
	`REG_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '등록일시',
	`UPD_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '수정일시'
);

CREATE TABLE `TB_ORDER_ITEM` (
	`ORDER_ITEM_NO`	BIGINT	NOT NULL	AUTO_INCREMENT  PRIMARY KEY COMMENT '주문 상품번호',
	`ORDER_NO`	BIGINT	NOT NULL	COMMENT '주문번호',
	`ITEM_NO`	BIGINT	NOT NULL	COMMENT '상품번호',
	`QUANTITY`	INT	NOT NULL	COMMENT '구매수량',
	`PRICE`	BIGINT	NOT NULL	COMMENT '가격',
	`REG_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '등록일시',
	`UPD_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '수정일시'
);

CREATE TABLE `TB_ITEM_REVIEW` (
	`ORDER_ITEM_NO`	BIGINT	NOT NULL	COMMENT '주문 상품번호',
	`USER_NO`	BIGINT	NOT NULL	COMMENT '유저번호',
	`TITLE`	VARCHAR(30)	NOT NULL	COMMENT '제목',
	`STAR`	INT	NOT NULL	COMMENT '별점',
	`CONTENT`	VARCHAR(1000)	NULL	COMMENT '리뷰내용',
	`IMAGE`	VARCHAR(200)	NULL	COMMENT '리뷰 이미지',
	`REG_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '등록일시',
	`UPD_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '수정일시'
);

CREATE TABLE `TB_COUPON` (
	`COUPON_NO`	BIGINT	NOT NULL	AUTO_INCREMENT  PRIMARY KEY COMMENT '쿠폰번호',
	`CATEGORY`	CHAR(2)	NOT NULL	COMMENT '쿠폰 분류',
	`CATEGORY_NM`	VARCHAR(20)	NOT NULL	COMMENT '쿠폰분류명',
	`NAME`	VARCHAR(20)	NOT NULL	COMMENT '쿠폰명',
	`STATUS`	CHAR(2)	NOT NULL	COMMENT '상태코드',
	`UNIT_CD`	CHAR(2)	NOT NULL	COMMENT '적용단위 코드',
	`DISCOUNT_PRICE`	BIGINT	NULL	COMMENT '할인 금액',
	`DISCOUNT_PERCENTAGE`	DECIMAL(3,2)	NULL	COMMENT '할인율',
	`INTRO`	VARCHAR(50)	NOT NULL	COMMENT '쿠폰 소개글',
	`REMAINS`	BIGINT	NULL	COMMENT '잔여 쿠폰량',
	`TOTAL_AMOUNT`	BIGINT	NULL	COMMENT '쿠폰 총량',
	`APPLY_DT`	DATETIME	NOT NULL	COMMENT '적용 시작일',
	`EXPIRE_DT`	DATETIME	NOT NULL	COMMENT '만료일',
	`REG_ID`	VARCHAR(30)	NOT NULL	COMMENT '쿠폰 등록자 아이디',
	`REG_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '등록일시',
	`UPD_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '수정일시'
);

CREATE TABLE `TB_BASKET` (
	`TRANS_NO`	BIGINT	NOT NULL	AUTO_INCREMENT  PRIMARY KEY COMMENT '장바구니 내역 식별번호',
	`USER_NO`	BIGINT	NULL	COMMENT '유저번호',
	`ITEM_NO`	BIGINT	NOT NULL	COMMENT '상품번호',
	`SESSION_ID`	VARCHAR(200)	NULL	COMMENT '비회원 식별 세션 아이디',
	`QUANTITY`	INT	NOT NULL	COMMENT '수량',
	`REG_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '등록일시',
	`UPD_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '수정일시'
);

CREATE TABLE `TB_EPAY` (
	`TRANS_NO`	BIGINT	NOT NULL	AUTO_INCREMENT  PRIMARY KEY COMMENT '거래번호',
	`USER_NO`	BIGINT	NOT NULL	COMMENT '유저번호',
	`ORDER_NO`	BIGINT	NOT NULL	COMMENT '주문번호',
	`TRANS_CD`	CHAR(2)	NOT NULL	COMMENT '거래코드',
	`PRICE`	BIGINT	NOT NULL	COMMENT 'epay 거래량',
	`REG_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '등록일시',
	`UPD_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '수정일시'
);

CREATE TABLE `TB_ISSUE_COUPON` (
	`TRANS_NO`	BIGINT	NOT NULL	AUTO_INCREMENT  PRIMARY KEY COMMENT '쿠폰발급 내역 식별번호',
	`COUPON_NO`	BIGINT	NOT NULL	COMMENT '쿠폰번호',
	`USER_NO`	BIGINT	NOT NULL	COMMENT '유저번호',
	`STATUS`	CHAR(2)	NOT NULL	COMMENT '상태코드',
	`USE_DT`	DATETIME	NULL	COMMENT '사용일시',
	`REG_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '등록일시',
	`UPD_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '수정일시'
);

CREATE TABLE `TB_CATEGORY` (
	`CATEGORY_NO`	BIGINT	NOT NULL	AUTO_INCREMENT  PRIMARY KEY COMMENT '카테고리 식별번호',
	`PARENT_CATEGORY_NO`	BIGINT	NULL	COMMENT '상위 카테고리 식별자',
	`CATEGORY_NM`	VARCHAR(100)	NOT NULL	COMMENT '카테고리 이름',
	`LEVEL`	TINYINT	NOT NULL	COMMENT '레벨',
	`REG_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '등록일시',
	`UPD_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '수정일시'
);

CREATE TABLE `TB_ADMIN` (
	`ADMIN_NO`	BIGINT	NOT NULL	AUTO_INCREMENT  PRIMARY KEY COMMENT '어드민 번호',
	`ADMIN_ID`	VARCHAR(30)	NOT NULL    COMMENT '아이디',
	`NAME`	VARCHAR(30)	NOT NULL    COMMENT '이름',
	`STATUS`	CHAR(2)	NOT NULL    COMMENT '상태코드',
	`LEVEL_CD`	CHAR(2)	NOT NULL    COMMENT '권한 그룹코드',
	`PASSWORD`	VARCHAR(200)	NOT NULL    COMMENT '비밀번호',
	`TEL`	VARCHAR(11)	NOT NULL    COMMENT '전화번호',
	`POST_NUM`	CHAR(6)	NOT NULL    COMMENT '우편번호',
	`ADDRESS`	VARCHAR(100)	NOT NULL    COMMENT '주소',
	`LAST_LOGIN_DT`	DATETIME	NOT NULL    DEFAULT NOW()   COMMENT '마지막 로그인 일시',
	`MODIFY_PW_DT`	DATETIME	NOT NULL    DEFAULT NOW()   COMMENT '비밀번호 변경 일시',
	`REG_DT`	DATETIME	NOT NULL    DEFAULT NOW()   COMMENT '등록일시',
	`UPD_DT`	DATETIME	NOT NULL    DEFAULT NOW()   COMMENT '수정일시'
);

CREATE TABLE `TB_TOKEN` (
    `TOKEN_NO`	BIGINT	NOT NULL    AUTO_INCREMENT  PRIMARY KEY COMMENT '토큰 번호',
    `USER_TYPE`	CHAR(2)	NOT NULL    COMMENT '유저타입',
    `USER_NO`	BIGINT	NOT NULL	COMMENT '유저번호',
    `TYPE`	VARCHAR(7)	NOT NULL    COMMENT '토큰타입',
    `RANDOM_STR`	VARCHAR(55)	NOT NULL    COMMENT '랜덤값',
    `EXPIRE_DT`	DATETIME	NOT NULL    COMMENT '만료일시',
    `DISCARD_DT`	DATETIME	NOT NULL    COMMENT '폐기일시',
    `REG_DT`	DATETIME	NOT NULL    DEFAULT NOW()   COMMENT '등록일시',
    `UPD_DT`	DATETIME	NOT NULL    DEFAULT NOW()   COMMENT '수정일시'
);

ALTER TABLE `TB_LIKE` ADD CONSTRAINT `PK_TB_LIKE` PRIMARY KEY (
	`USER_NO`,
	`ITEM_NO`
);

ALTER TABLE `TB_ITEM_REVIEW` ADD CONSTRAINT `PK_TB_ITEM_REVIEW` PRIMARY KEY (
	`ORDER_ITEM_NO`
);

ALTER TABLE `TB_LIKE` ADD CONSTRAINT `FK_TB_MEMBER_TO_TB_LIKE_1` FOREIGN KEY (
	`USER_NO`
)
REFERENCES `TB_MEMBER` (
	`USER_NO`
);

ALTER TABLE `TB_LIKE` ADD CONSTRAINT `FK_TB_ITEM_TO_TB_LIKE_1` FOREIGN KEY (
	`ITEM_NO`
)
REFERENCES `TB_ITEM` (
	`ITEM_NO`
);

ALTER TABLE `TB_ITEM_REVIEW` ADD CONSTRAINT `FK_TB_ORDER_ITEM_TO_TB_ITEM_REVIEW_1` FOREIGN KEY (
	`ORDER_ITEM_NO`
)
REFERENCES `TB_ORDER_ITEM` (
	`ORDER_ITEM_NO`
);

