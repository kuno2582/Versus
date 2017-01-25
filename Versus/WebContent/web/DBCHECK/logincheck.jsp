<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>
	<%!
		String id,pw;
	%>
	<%
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		
		String URL = "jdbc:mysql://localhost:3306/mytest";		//3306은 Mysql포트번호, mytest는 DB명
		String USER = "root";							//계정 id, APMSETUP은 기본적으로 root
		String PASS="apmsetup";						//마찬가지로 APMSETUP은 기본적으로 apmsetup

		Connection conn=null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		int rowCount;

		try
		{	
			Class.forName("com.mysql.jdbc.Driver");		//mysql을 사용
			conn = DriverManager.getConnection(URL, USER, PASS);		//아이디, 비밀번호, 주소를 넣고 연결
			stmt = conn.createStatement();
			rs = stmt.executeQuery( "select * from member_info where ID='" + id +"'" );		//member_info은 DB내 테이블명
			
			while(rs.next()){
				String dbid = rs.getString("ID");				//ID, PASSWORD은 테이블 내 필드명입니다
				String dbpassword = rs.getString("PASSWORD");
				if(pw.equals(dbpassword)){
					session.setAttribute("id",id);
					%> 
					<script type="text/javascript">
					alert("<%=dbid%>" + "님 어서오세요");
					history.go(-1);
					</script>
					<%  
				}else{
					%><script type="text/javascript"> alert("비밀번호가 다릅니다."); history.go(-1); </script> <%
				}
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
</body>
</html>