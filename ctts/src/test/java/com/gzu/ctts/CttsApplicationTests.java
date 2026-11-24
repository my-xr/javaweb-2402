package com.gzu.ctts;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootTest
class CttsApplicationTests {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Test
    void encode() {

        System.out.println(passwordEncoder.encode("123456"));
    }

    //$2a$10$hiwJOBndXKaPPYaliXQnbupP2TP/q.P00V5SH6HjZfBvgSLRt1zTe

    @Test
    void decode() {
        System.out.println(passwordEncoder.matches("123456", "$2a$10$hiwJOBndXKaPPYaliXQnbupP2TP/q.P00V5SH6HjZfBvgSLRt1zTe"));
    }
}
