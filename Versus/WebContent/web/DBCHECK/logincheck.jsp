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
		
		String URL = "jdbc:mysql://localhost:3306/mytest";		//3306�� Mysql��Ʈ��ȣ, mytest�� DB��
		String USER = "root";							//���� id, APMSETUP�� �⺻������ root
		String PASS="apmsetup";						//���������� APMSETUP�� �⺻������ apmsetup

		Connection conn=null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		int rowCount;

		try
		{	
			Class.forName("com.mysql.jdbc.Driver");		//mysql�� ���
			conn = DriverManager.getConnection(URL, USER, PASS);		//���̵�, ��й�ȣ, �ּҸ� �ְ� ����
			stmt = conn.createStatement();
			rs = stmt.executeQuery( "select * from member_info where ID='" + id +"'" );		//member_info�� DB�� ���̺��
			
			while(rs.next()){
				String dbid = rs.getString("ID");				//ID, PASSWORD�� ���̺� �� �ʵ���Դϴ�
				String dbpassword = rs.getString("PASSWORD");
				if(pw.equals(dbpassword)){
					session.setAttribute("id",id);
					%> 
					<script type="text/javascript">
					alert("<%=dbid%>" + "�� �������");
					history.go(-1);
					</script>
					<%  
				}else{
					%><script type="text/javascript"> alert("��й�ȣ�� �ٸ��ϴ�."); history.go(-1); </script> <%
				}
			}
			
		}catch(SQLException e)					//try�� ����
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