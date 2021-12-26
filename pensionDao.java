package finalTest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.sql.Statement;



public class pensionDao {
	
	
	//MySQL DB 연동
	String id = "root";
	String pass = "111111";
	//jdbc:mysql://localhost:3306/jspdb -> DB명
	String url = "jdbc:mysql://localhost:3306/jspdb?characterEncoding=utf-8";
	
	Connection con = null; //DB 연결 
	PreparedStatement pstmt = null; //SQL문 구성
	ResultSet rs = null; //SQL문 실행결과 처리 
	Statement st = null;
	
	public void connect_cp() {
		try{
			//컨텍스트 객체 생성
			Context initctx = new InitialContext();
			
			//context.xml 기반의 환경설정 객체 접근 객체변수 설정 
			Context envctx = (Context) initctx.lookup("java:/comp/env");
			
			//커넥션 폴에 접근
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			
			//db 연결
			con = ds.getConnection();
			
			System.out.println("커넥션 풀을 이용하여 데이터베이스 연결 성공 !!");
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}
	
	//데이터베이스 연결
	public void connect() {
		//드라이버 로드
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//DB 연결
			con = DriverManager.getConnection(url, id, pass);
			
			System.out.println("MySQL 연결 성공 !!");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	//데이터베이스 연결 해제 
	public void disconnect() {
		if(con != null){
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(pstmt != null){
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(rs != null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void insertpension(pensionDo pDo) {
		//1. DB연결
		connect_cp();
		
		//2. sql처리
		//SQL 구성
		String sql = "insert into pension (name, tel, email, gender, room, job)"
				+ " values(?,?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pDo.getName());
			pstmt.setString(2, pDo.getTel());
			pstmt.setString(3, pDo.getEmail());
			pstmt.setString(4, pDo.getGender());
			pstmt.setString(5, pDo.getRoom());
			pstmt.setString(6, pDo.getJob());
			
			//SQL 실행
			pstmt.executeUpdate();
			System.out.println("insertpension(pensionDo pDo) 데이터베이스 처리 완료 ! ");
			
		} catch(SQLException e){
			e.printStackTrace();
		}
		
		
		
		//3. DB연결해제
		disconnect();
	}
	
	public ArrayList<pensionDo> getAllpension(){
		
		//1. DB 연결
		connect_cp();
		
		//2. SQL문 처리
		ArrayList<pensionDo> pList = new ArrayList<pensionDo>();
		String sql = "select * from pension";
		try {
			pstmt = con.prepareStatement(sql);
			//3. 실행
			rs = pstmt.executeQuery(); //SQL 처리 결과 rs에 리턴 
			while(rs.next()) {
				pensionDo pDo = new pensionDo();
				pDo.setNum(rs.getInt(1)); //num
				pDo.setName(rs.getString(2)); //name
				pDo.setTel(rs.getString(3)); //tel
				pDo.setEmail(rs.getString(4)); //email
				pDo.setGender(rs.getString(5)); //gender
				pDo.setRoom(rs.getString(6)); //room
				pDo.setJob(rs.getString(7)); //job
				
				pList.add(pDo);

			}
			
			System.out.println("getAllpension() 처리 완료 !");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		//3. DB 연결해제 
		disconnect();
		
		
		return pList;
	}
	
	public pensionDo getPensionOne(int num) {
		System.out.println("getPensionOne() 처리 시작 ! ");
		connect_cp();
		
		pensionDo pDo = new pensionDo();
		
		
		try {
			String sql = "select * from pension where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				pDo.setNum(rs.getInt(1));
				pDo.setName(rs.getString(2));
				pDo.setTel(rs.getString(3));
				pDo.setEmail(rs.getString(4));
				pDo.setGender(rs.getString(5));
				pDo.setRoom(rs.getString(6));
				pDo.setJob(rs.getString(7));
			}
			
			disconnect();
			System.out.println("getPensionOne() 처리 완료 ! ");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pDo;
	}
	
	public void modifypension(pensionDo pDo) {
		System.out.println("modifypension() 처리 시작 !");
		connect_cp();
		
		try {String sql = "update pension set name=?, tel=?, email=?, gender=?, room=?, job=?  "
				+ "where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pDo.getName());
			pstmt.setString(2, pDo.getTel());
			pstmt.setString(3, pDo.getEmail());
			pstmt.setString(4, pDo.getGender());
			pstmt.setString(5, pDo.getRoom());
			pstmt.setString(6, pDo.getJob());
			pstmt.setInt(7, pDo.getNum());
			pstmt.executeUpdate();
			
			disconnect();
			System.out.println("modifypension() 처리완료 !");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public ArrayList<pensionDo> getpensionlist(){
		
		ArrayList<pensionDo> pList = new ArrayList<pensionDo>();
		
		try{
			st = con.createStatement();
			rs = st.executeQuery("select * from pension");
			
			while(rs.next()){
				pensionDo pDo = new pensionDo();
				
				pDo.setNum(rs.getInt(1));
				pDo.setName(rs.getString(2));
				pDo.setTel(rs.getString(3));
				pDo.setEmail(rs.getString(4));
				pDo.setGender(rs.getString(5));
				pDo.setRoom(rs.getString(6));
				pDo.setJob(rs.getString(7));
				
				pList.add(pDo);
			}
		}catch(Exception e){
			System.out.println(e+"=>getpensionlist fail");
		}
		
		return pList;
	}

	
	public ArrayList<pensionDo> getpensionlist(String keyField, String keyWord){
		
		ArrayList<pensionDo> pList = new ArrayList<pensionDo>();
		
		try{
			
			String sql = "select * from pension";
			
			if(keyWord != null && !keyWord.equals("")) {
				sql +="WHERE" + keyField.trim()+"LIKE'%"+keyWord.trim()+"%' order by id";
			}else{
				sql +="order by id";
			}
			System.out.println("sql = " + sql);
			st = con.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				pensionDo pDo = new pensionDo();
				
				pDo.setNum(rs.getInt(1));
				pDo.setName(rs.getString(2));
				pDo.setTel(rs.getString(3));
				pDo.setEmail(rs.getString(4));
				pDo.setGender(rs.getString(5));
				pDo.setRoom(rs.getString(6));
				pDo.setJob(rs.getString(7));
				
				pList.add(pDo);
				
			}
		}catch(Exception e){
			System.out.println(e+"=>getpensionlist fail");
		}
		return pList;
	}
	
	
	
	public void deletePension(int num){
		System.out.println("deletepension() 처리 시작!");
		connect_cp();
		
		
		try {String sql = "delete from pension where num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
			disconnect();
			System.out.println("deletePension() 처리완료! ");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}