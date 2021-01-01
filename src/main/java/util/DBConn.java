package util;

import java.sql.*;
public class DBConn {
    static{
        try{
        	Class.forName("net.sourceforge.jtds.jdbc.Driver");
            //Class.forName("com.mysql.jdbc.Driver");
        }catch(Exception ex){
            ex.printStackTrace();
        }

    }

    public static Connection getConn(){
        try{
        	Connection conn=DriverManager.getConnection("jdbc:jtds:sqlserver://localhost:1433;DatabaseName=zwysw","sa","1");
            //Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/films?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8&useSSL=true","root","12345");
            return conn;
        }catch(Exception ex){
            ex.printStackTrace();
            return null;
        }
    }
    public static void close(Connection conn,Statement st,ResultSet rs){
    	if(rs!=null){
            try{
                rs.close();
            }catch(SQLException ex){
            }
       }
       if(st!=null){
           try {
               st.close();
           }catch(Exception ex){
           }
       }
       if(conn!=null){
           try{
               conn.close();
           }catch(Exception ex){
           }
       }
    }

}
