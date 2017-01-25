<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
String URL = "jdbc:mysql://localhost:3306/mytest";		//3306은 Mysql포트번호, mytest는 DB명
String USER = "root";							//계정 id, APMSETUP은 기본적으로 root
String PASS="apmsetup";						//마찬가지로 APMSETUP은 기본적으로 apmsetup

Connection conn=null;
Statement stmt = null;
ResultSet rs = null;

try
{	
	Class.forName("com.mysql.jdbc.Driver");		//mysql을 사용
	conn = DriverManager.getConnection(URL, USER, PASS);		//아이디, 비밀번호, 주소를 넣고 연결
	stmt = conn.createStatement();
	rs = stmt.executeQuery( "select * from member_info" );		//member_info은 DB내 테이블명
	while( rs.next() )
	{
		String id = rs.getString("ID");				//pid, name은 테이블 내 필드명입니다
		String password = rs.getString("PASSWORD");
		out.println(" 아이디 : "+id+"<br>"+"비번 : "+password+"<br><br>");
	}
}catch(SQLException e)					//try문 종료
{
	out.println(e.getMessage());
}
finally
{
	if(rs != null)try{rs.close();}catch(SQLException ex){}
	if(stmt != null)try{stmt.close();}catch(SQLException ex){}
	if(conn != null)try{conn.close();}catch(SQLException ex){}
}
%>
