package com.fk.shopping.controller;

import com.fk.shopping.entity.Kind;
import com.fk.shopping.service.KindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @ClassName KindController
 * @Description TODO
 * @Date 2020/4/19 16:50
 * @Created by FangKun
 */
@Controller
@Scope("prototype")
public class KindController {

    @Autowired
    private KindService kindService;

    @RequestMapping("/getKind")
    @ResponseBody
    public List<Kind> getKind(){
        List<Kind> allKind = kindService.getAllKind();
//        System.out.println(allKind.toString());
        return allKind;
    }




}
