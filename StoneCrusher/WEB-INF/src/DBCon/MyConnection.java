package DBCon;
import java.sql.*;
public class MyConnection {
	
	Connection con = null;
	public Connection connect(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/crusher","root","root");
			
		}
		catch(Exception e){
			System.out.println(e);
		}
		return con;
	}

}
