package westos.jabc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Jdbc01 {
    public static void main(String args[]) throws ClassNotFoundException, SQLException {
        //定义变量
        String driverName="com.mysql.jdbc.Driver";
        String url="jdbc:mysql://localhost:3306/sjk1?useUnicode=true&characterEnconding=utf-8";
        String username="root";
        String password="4214963";
        //使用class.forname创建数据库驱动实例
        Class.forName(driverName);
        //用DriverManager获取连接
        Connection con= DriverManager.getConnection(url,username,password);
        System.out.println("con.idclosed:"+con.isClosed());
    }
}
