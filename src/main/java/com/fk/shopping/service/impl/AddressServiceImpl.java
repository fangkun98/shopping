package com.fk.shopping.service.impl;

import com.fk.shopping.dao.AddressMapper;
import com.fk.shopping.entity.Address;
import com.fk.shopping.service.AddressService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName AddressServiceImpl
 * @Description TODO
 * @Date 2020/5/5 14:34
 * @Created by FangKun
 */
@Service
public class AddressServiceImpl implements AddressService {
    @Resource
    AddressMapper addressMapper;
    @Override
    public List<Address> getAddress(Integer uid) {
        return addressMapper.getAddress(uid);
    }

    @Override
    public int delAddress(Integer id) {
        return addressMapper.delAddress(id);
    }

    @Override
    public int addAddress(Address address) {
        return addressMapper.addAddress(address);
    }

    @Override
    public int updateAddress(Address address) {
        return addressMapper.updateAddress(address);
    }

    @Override
    public int updateState(Integer uid, Integer id) {
        return addressMapper.updateState(uid,id);
    }

    @Override
    public List<Address> getAllAddress() {
        return addressMapper.getAllAddress();
    }
}
