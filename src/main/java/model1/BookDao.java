package model1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BookDao {

	public Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager
					.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "kic", "1111");
		    System.out.println("db ok");
			return conn;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 System.out.println("db error");
         return null;
	}
	
	public int insertBook(Book b) throws SQLException {
		Connection con = getConnection();
		
		PreparedStatement pstmt 
		= con.prepareStatement("insert into book values (?,?,?, sysdate)");
		pstmt.setString(1, b.getWriter());
		pstmt.setString(2, b.getTitle());
		pstmt.setString(3, b.getContent());
		return pstmt.executeUpdate();
	}
	
}
