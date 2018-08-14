package com.westos.untitle2.bean;

import java.util.ArrayList;
import java.util.List;

public class Shengfen {
    private static String Name;
    private List<String> citys;

    public static void setName(String name) {
        Name = name;
    }

    public void setCitys(List<String> citys) {
        this.citys = citys;
    }

    public static String getName() {
        return Name;
    }

    public List<String> getCitys() {
        return citys;
    }

    public void addCity(String city){
        if (this.citys == null) {
            this.citys=new ArrayList<>();
        }
        this.citys.add(city);

    }

    @Override
    public String toString() {
        return "Shengfen{"+"name='" + Name + '\'' +
                ", citys=" + citys +
                '}';
    }
}
