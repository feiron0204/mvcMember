package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.bean.MemberDTO;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MemberDAO() {
		try {
			//driver loading
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("driver loading");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bituser","1004");
			System.out.println("connection success");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String login(String id, String pwd) {
		String name=null;
		String sql = "select * from member where id=? and pwd=?";
		this.getConnection();//호출
		try {
			pstmt=conn.prepareStatement(sql);//문장처리하는 가이드 생성
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			//실행
			rs=pstmt.executeQuery();
			if(rs.next()) {
				name=rs.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return name;
	}
	
	public int write(MemberDTO dto) {
		
		String sql = "insert into member values (?,?,?,?,?,?,?,?,?,?,?,?,SYSDATE)";
		this.getConnection();//호출
		try {
			pstmt=conn.prepareStatement(sql);//문장처리하는 가이드 생성
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPwd());
			pstmt.setString(4, dto.getGender());
			pstmt.setString(5, dto.getEmail1());
			pstmt.setString(6, dto.getEmail2());
			pstmt.setString(7, dto.getTel1());
			pstmt.setString(8, dto.getTel2());
			pstmt.setString(9, dto.getTel3());
			pstmt.setString(10, dto.getZipcode());
			pstmt.setString(11, dto.getAddr1());
			pstmt.setString(12, dto.getAddr2());
			//실행
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
}
