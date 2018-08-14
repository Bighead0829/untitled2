package com.westos.untitle2.CityService;

import com.westos.untitle2.bean.Shengfen;

import java.util.ArrayList;
import java.util.List;

public class CityService {
   public List<Shengfen> setShengfen(){
       List<Shengfen> list=new ArrayList<>();
       Shengfen s1=new Shengfen();
       s1.setName("陕西");
       s1.addCity("西安");
       s1.addCity("榆林");
       list.add(s1);
       Shengfen s2=new Shengfen();
       s2.setName("江苏");
       s2.addCity("南京");
       s2.addCity("榆林");
       list.add(s2);
       return list;
   }

}
