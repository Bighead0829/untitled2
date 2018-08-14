package com.westos.untitle2.CityService;

import com.westos.untitle2.bean.User;
import sun.rmi.log.LogInputStream;

import java.util.ArrayList;
import java.util.List;

public class UserService {
    public List<User> setUser(){
        List<User> list=new ArrayList<>();
        User u1=new User();
        u1.setUsername("Bighead");
        u1.setPassword("4214963");
        list.add(u1);
        User u2=new User();
        u2.setUsername("lyy");
        u2.setPassword("0829");
        list.add(u2);
        return list;
    }
}
