package com.fk.shopping.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @ClassName MD5Utils
 * @Description TODO 密码加密
 * @Date 2020/4/12 14:55
 * @Created by FangKun
 */
public class MD5Utils {
    public static String md5(String password){
        //生成一个md5加密器
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            //计算MD5 的值
            md.update(password.getBytes());
            //BigInteger 将8位的字符串 转成16位的字符串 得到的字符串形式是哈希码值
            //BigInteger(参数1,参数2) 参数1 是 1为正数 0为0 -1为负数
            return new BigInteger(1, md.digest()).toString(16);
        } catch (NoSuchAlgorithmException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    public static String hash(String source, String saltStr, int hashIterations) throws NoSuchAlgorithmException {
        byte[] bytes = source.getBytes();
        byte[] salt = saltStr.getBytes();
        // MD5 SHA-256  SHA-512  选择一种加密算法
        MessageDigest digest = MessageDigest.getInstance("SHA-512");
        if (salt != null) { //判断盐是否存在
            digest.reset();
            digest.update(salt);
        }
        byte[] hashed = digest.digest(bytes);
        int iterations = hashIterations - 1;

        for(int i = 0; i < iterations; ++i) {// 迭代加密
            digest.reset();
            hashed = digest.digest(hashed);//加密
        }
        return new BigInteger(1, hashed).toString(16);//将密文的字节数组转成整数，再转成16进制的字符串
    }
}
