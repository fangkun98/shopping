package com.fk.shopping.service.impl;

import com.fk.shopping.dao.KindMapper;
import com.fk.shopping.entity.Kind;
import com.fk.shopping.service.KindService;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName KindServiceImpl
 * @Description TODO
 * @Date 2020/4/19 16:49
 * @Created by FangKun
 */
@Service
public class KindServiceImpl implements KindService {

    @Autowired
    private KindMapper kindMapper;

    @Override
    public List<Kind> getAllKind() {
        return kindMapper.getAllKind();
    }

    @Override
    public Kind getKindById(Integer cate_id) {
        return kindMapper.getKindById(cate_id);
    }
}
