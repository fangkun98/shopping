package com.fk.shopping.service;

import com.fk.shopping.entity.Address;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @ClassName AddressService
 * @Description TODO
 * @Date 2020/5/5 14:34
 * @Created by FangKun
 */
public interface AddressService {
    //根据uid查询用户所有地址
    List<Address> getAddress(Integer uid);
    //删除地址
    int delAddress(Integer id);
    //添加地址
    int addAddress(Address address);
    //修改地址
    int updateAddress(Address address);
    //修改默认地址
    int updateState(@Param("uid") Integer uid, @Param("id") Integer id);

    //查询所有的用户的所有地址
    List<Address> getAllAddress();
}
