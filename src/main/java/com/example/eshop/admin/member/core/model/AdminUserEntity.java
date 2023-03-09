package com.example.eshop.admin.member.core.model;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@NoArgsConstructor
public class AdminUserEntity {
    private long adminNo;

    private String adminId;

    @Setter
    private String name;

    @Setter
    private String status;

    private String levelCd;

    @Setter
    private String password;

    @Setter
    private String tel;

    @Setter
    private String postNum;

    @Setter
    private String address;

    @Setter
    private LocalDate lastLoginDt;

    @Setter
    private LocalDate modifyPwDt;

    private LocalDate regDt;

    @Setter
    private LocalDate updDt;

    @Builder
    public AdminUserEntity(String adminId, String name, String levelCd,
                           String password, String tel, String postNum,
                           String address) {
        this.adminId = adminId;
        this.name = name;
        this.status = "0";
        this.levelCd = levelCd;
        this.password = password;
        this.tel = tel;
        this.postNum = postNum;
        this.address = address;
    }
}
