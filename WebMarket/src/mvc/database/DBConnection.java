package mvc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection getConnection() throws SQLException,ClassNotFoundException{
		Connection conn = null;
		
		String url = "jdbc:oracle:thin:@db202110231136_high?TNS_ADMIN=/Users/alpha/oracle/Wallet_DB202110231136";
		String user="admin";
		String password="Jh12345678!!";
		
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url,user,password);
		return conn;
		
	}
/*
public static void main(String[] args) throws ClassNotFoundException, SQLException {
		if(DBConnection.getConnection()!=null)
			System.out.println("연결 성공!!!!!");
		else
			System.out.println("연결 실패.....");
	}
*/
}
