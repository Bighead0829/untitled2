package com.westos.untitle2.CityService;

import com.westos.untitle2.bean.Hero;

import java.util.ArrayList;
import java.util.List;

public class HeroService {
    //获取英雄列表
    private List<Hero> list=new ArrayList<Hero>();
    //通过排名查找英雄
    public Hero findHero(Integer number) {
        return null;
    }
    //获取所有英雄信息
    public List<Hero> heroList(){
        return heroList();
    }
    //添加
    public List<Hero> addHero(Hero hero){
        list.add(hero);
        return list;
    }
    //修改
    public Hero editHero(Hero hero){
        //通过排名获取要修改的英雄信息
        Hero edithero=findHero(hero.getNumber());
        edithero.setName(hero.getName());
        return edithero;
    }
    //删除

    public List<Hero> delHero(Hero hero) {
        //通过排名获取要删除的英雄信息
        Hero delhero=findHero(hero.getNumber());
        list.remove(delhero.getName());
        return list;
    }
}
