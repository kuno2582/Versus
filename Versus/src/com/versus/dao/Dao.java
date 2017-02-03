package com.versus.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.versus.dto.CommentDto;
import com.versus.dto.FaqDto;
import com.versus.dto.InputMemberInfoDto;
import com.versus.dto.MatchDto;
import com.versus.dto.TeamDto;

public class Dao {

	public int loginCheck(String requestId, String requestPw){
		
		//3306은 Mysql포트번호, mytest는 DB명
		String URL = "jdbc:mysql://localhost:3306/versus?useUnicode=true&characterEncoding=euc-kr";	
		String USER = "root";							//계정 id, APMSETUP은 기본적으로 root
		String PASS="apmsetup";						//마찬가지로 APMSETUP은 기본적으로 apmsetup

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		int loginResult = 0;	//존재하는 아이디가 없을 때, 디폴트값

		try{	
			Class.forName("com.mysql.jdbc.Driver");		//mysql을 사용
			connection = DriverManager.getConnection(URL, USER, PASS);		//아이디, 비밀번호, 주소를 넣고 연결
			
			String query = "SELECT * FROM member_info where ID=?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, requestId);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()){
				String password = resultSet.getString("PASSWORD");

				if(!(password.equals(requestPw))){
					loginResult = 1;	//비밀번호가 다를 때
					System.out.println("비밀번호가 다릅니다");
				}else{
					loginResult = 2;	//로그인 성공
					System.out.println("로그인 성공!");
				}
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(resultSet!=null)resultSet.close();
				if(preparedStatement!=null)preparedStatement.close();
				if(connection!=null)connection.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		return loginResult;
		
	}//loginCheck()
	
	public InputMemberInfoDto inputMemberInfo(String requestId){
		
		String URL = "jdbc:mysql://localhost:3306/versus?useUnicode=true&characterEncoding=euc-kr";	//3306은 Mysql포트번호, mytest는 DB명
		String USER = "root";							//계정 id, APMSETUP은 기본적으로 root
		String PASS="apmsetup";						//마찬가지로 APMSETUP은 기본적으로 apmsetup

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		InputMemberInfoDto dto = null;
		
		try{	
			Class.forName("com.mysql.jdbc.Driver");		//mysql을 사용
			connection = DriverManager.getConnection(URL, USER, PASS);		//아이디, 비밀번호, 주소를 넣고 연결
			
			String query = "SELECT * FROM member_info JOIN team_info on member_info.team_code=team_info.team_code where member_info.ID=?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, requestId);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()){
				
				String id = resultSet.getString("ID");
				String nickName = resultSet.getString("NICKNAME");
				String region = resultSet.getString("REGION");
				int team_code = resultSet.getInt("TEAM_CODE");
				String team_name = resultSet.getString("team_name");
				Boolean leader = resultSet.getBoolean("leader");
				Boolean second_leader = resultSet.getBoolean("second_leader");
				
				dto = new InputMemberInfoDto(id, nickName, region, team_code, team_name, leader, second_leader);

			}else{
				System.out.println(requestId);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(resultSet!=null)resultSet.close();
				if(preparedStatement!=null)preparedStatement.close();
				if(connection!=null)connection.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		return dto;
		
	}//InputMemberInfoDto
	
	public String signUpCheckId(String checkId){

		String URL = "jdbc:mysql://localhost:3306/versus?useUnicode=true&characterEncoding=euc-kr";		
		String USER = "root";							
		String PASS="apmsetup";		

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String result = "아이디를 사용할 수 있습니다.";
		
		try{
			
			Class.forName("com.mysql.jdbc.Driver");	
			connection = DriverManager.getConnection(URL, USER, PASS);
			String query = "SET NAMES euckr";
			Statement stat = connection.createStatement();
			stat.executeQuery(query);
			
			query = "SELECT * FROM member_info WHERE ID = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, checkId);	//쿼리문 ? 내용
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()){
				result = "이미 아이디가 존재합니다.";
			}
			
		}catch(Exception e){
			e.printStackTrace();
			result="실패";
		}finally{
			try{
				if(resultSet!=null)resultSet.close();
				if(preparedStatement!=null)preparedStatement.close();
				if(connection!=null)connection.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return result;
	} 	//signUpCheckId
	/*
	public ArrayList<TeamDto> signUpCheckTeam(){
		
		String URL = "jdbc:mysql://localhost:3306/versus?useUnicode=true&characterEncoding=euc-kr";		
		String USER = "root";							
		String PASS="apmsetup";					

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		ArrayList<TeamDto> dtos = new ArrayList<TeamDto>();
		
		try{	
			Class.forName("com.mysql.jdbc.Driver");	
			connection = DriverManager.getConnection(URL, USER, PASS);
			
			String query = "SELECT * FROM team_info";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()){
				
				String team_name = resultSet.getString("TEAM_NAME");
				int team_code = resultSet.getInt("TEAM_CODE");
				TeamDto dto = new TeamDto(team_code,team_name);
				dtos.add(dto);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(resultSet!=null)resultSet.close();
				if(preparedStatement!=null)preparedStatement.close();
				if(connection!=null)connection.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		return dtos;
	}//signUpCheckTeam
*/	
	public String signUp(String ID, String Password, String Region, String Email, int team_code){
		
		String URL = "jdbc:mysql://localhost:3306/versus?useUnicode=true&characterEncoding=euc-kr";		
		String USER = "root";							
		String PASS="apmsetup";		

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String result;
		
		try{
			
			Class.forName("com.mysql.jdbc.Driver");	
			connection = DriverManager.getConnection(URL, USER, PASS);
			String query = "SET NAMES euckr";
			Statement stat = connection.createStatement();
			stat.executeQuery(query);
			
			query = "INSERT INTO member_info(ID, PASSWORD, REGION, MAIL, TEAM_CODE) VALUES (?, ?, ?, ?, ?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, ID);	//쿼리문 ? 내용
			preparedStatement.setString(2, Password);
			preparedStatement.setString(3, Region);
			preparedStatement.setString(4, Email);
			preparedStatement.setInt(5, team_code);
			preparedStatement.executeUpdate();
			result = "성공";
			
		}catch(Exception e){
			e.printStackTrace();
			result="실패";
		}finally{
			try{
				if(preparedStatement!=null)preparedStatement.close();
				if(connection!=null)connection.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public void makeTeam(String team_name, String leader_id, String team_phone, String team_region){
		
		String URL = "jdbc:mysql://localhost:3306/versus?useUnicode=true&characterEncoding=euc-kr";		
		String USER = "root";							
		String PASS="apmsetup";		

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement preparedStatement2 = null;
		PreparedStatement preparedStatement3 = null;
		PreparedStatement preparedStatement4 = null;
		ResultSet resultSet = null;
		ResultSet resultSet2 = null;
		
		try{
			
			Class.forName("com.mysql.jdbc.Driver");	
			connection = DriverManager.getConnection(URL, USER, PASS);
			String query = "SET NAMES euckr";
			Statement stat = connection.createStatement();
			stat.executeQuery(query);
			
			query = "SELECT * FROM team_info WHERE TEAM_NAME = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, team_name);	//쿼리문 ? 내용
			resultSet = preparedStatement.executeQuery();
			if(resultSet.next()){
				System.out.println("dao.makeTeam(), 이미 팀이 존재합니다.");
			}else{
				query = "INSERT INTO team_info(TEAM_NAME, LEADER_ID, PHONE, REGION) VALUES (?, ?, ?, ?)";
				preparedStatement2 = connection.prepareStatement(query);
				preparedStatement2.setString(1, team_name);	//쿼리문 ? 내용
				preparedStatement2.setString(2, leader_id);
				preparedStatement2.setString(3, team_phone);
				preparedStatement2.setString(4, team_region);
				preparedStatement2.executeUpdate();
				
				query="SELECT * FROM team_info WHERE TEAM_NAME = ?";
				preparedStatement3 = connection.prepareStatement(query);
				preparedStatement3.setString(1, team_name);
				resultSet2 = preparedStatement3.executeQuery();
				int team_code = 0;
				if(resultSet2.next()){
					team_code = resultSet2.getInt("TEAM_CODE");
				}
				
				query = "UPDATE member_info SET LEADER=1,TEAM_CODE=? WHERE ID=?";
				preparedStatement4 = connection.prepareStatement(query);
				preparedStatement4.setInt(1, team_code);
				preparedStatement4.setString(2, leader_id);
				preparedStatement4.executeUpdate();
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(preparedStatement4!=null)preparedStatement4.close();
				if(resultSet2!=null)resultSet2.close();
				if(preparedStatement3!=null)preparedStatement3.close();
				if(preparedStatement2!=null)preparedStatement2.close();
				if(resultSet!=null)resultSet.close();
				if(preparedStatement!=null)preparedStatement.close();
				if(connection!=null)connection.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
	}//makeTeam()
	
	public void makeMatch(int teamCode, String match_place, Timestamp match_date, String nickName, String match_phone, 
			String match_uniform, int shower, int parking, int neon, int whistle, String match_more){
		
		String URL = "jdbc:mysql://localhost:3306/versus?useUnicode=true&characterEncoding=euc-kr";		
		String USER = "root";							
		String PASS="apmsetup";		

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try{
			
			Class.forName("com.mysql.jdbc.Driver");	
			connection = DriverManager.getConnection(URL, USER, PASS);
			String query = "SET NAMES euckr";
			Statement stat = connection.createStatement();
			stat.executeQuery(query);
			
			query = "INSERT INTO match_info(TEAM_CODE, MATCH_REGION, MATCH_DATE, MATCH_LEADER_NICKNAME,"
					+ " MATCH_PHONE, UNIFORM, SHOWER, PARKING, NEON, WHISTLE, MORE_INFO) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, teamCode);	//쿼리문 ? 내용
			preparedStatement.setString(2, match_place);
			preparedStatement.setTimestamp(3, match_date);
			preparedStatement.setString(4, nickName);
			preparedStatement.setString(5, match_phone);
			preparedStatement.setString(6, match_uniform);
			preparedStatement.setInt(7, shower);
			preparedStatement.setInt(8, parking);
			preparedStatement.setInt(9, neon);
			preparedStatement.setInt(10, whistle);
			preparedStatement.setString(11, match_more);
			preparedStatement.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(preparedStatement!=null)preparedStatement.close();
				if(connection!=null)connection.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}//makeMatch()
	
	public ArrayList<MatchDto> searchMatch(String region1, String region2, Timestamp match_date1, Timestamp match_date2){
		
		ArrayList<MatchDto> dtos = new ArrayList<MatchDto>();
		
		String URL = "jdbc:mysql://localhost:3306/versus?useUnicode=true&characterEncoding=euc-kr";		
		String USER = "root";							
		String PASS="apmsetup";		

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");	
			connection = DriverManager.getConnection(URL, USER, PASS);
			String query = "SET NAMES euckr";
			Statement stat = connection.createStatement();
			stat.executeQuery(query);
			
			query = "select * from match_info join team_info on match_info.team_code=team_info.team_code" + 
			" where match_info.match_region like ? and match_info.match_region like"
					+" ? and match_info.match_date between ? and ?";
			
			/*query = "select match_num,match_progress,match_info.team_code,opponent_code,match_region,"+
			"match_date,match_leader_nickname,match_phone,match_info.uniform,shower,parking,neon,"
			+ "whistle,more_info,team_name from match_info join team_info on match_info.team_code="
			+ "team_info.team_code where match_info.match_region like ? and match_info.match_region like ?"
			+ " and match_info.match_date between ? and ?";*/
			
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, region1 + "%");	//쿼리문 ? 내용
			preparedStatement.setString(2, "%" + region2 + "%");
			preparedStatement.setTimestamp(3, match_date1);
			preparedStatement.setTimestamp(4, match_date2);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()){
				
				int match_num = resultSet.getInt("match_num");
				int match_progress = resultSet.getInt("match_progress");
				int team_code = resultSet.getInt("team_code");
				int opponent_code = resultSet.getInt("opponent_code");
				String match_region = resultSet.getString("match_region");
				Timestamp match_date = resultSet.getTimestamp("match_date");
				String match_leader_nickname = resultSet.getString("match_leader_nickname");
				String match_phone = resultSet.getString("match_phone");
				String uniform = resultSet.getString("uniform");
				Boolean shower = resultSet.getBoolean("shower");
				Boolean parking = resultSet.getBoolean("parking");
				Boolean neon = resultSet.getBoolean("neon");
				Boolean whistle = resultSet.getBoolean("whistle");
				String more_info = resultSet.getString("more_info");
				String team_name = resultSet.getString("team_name");
				int level = resultSet.getInt("level");
				int win = resultSet.getInt("win");
				int lose = resultSet.getInt("lose");
				int draw = resultSet.getInt("draw");
				int penalty = resultSet.getInt("penalty");
				MatchDto dto = new MatchDto(match_num,match_progress,team_code,team_name,opponent_code,match_region,match_date,
						match_leader_nickname,match_phone,uniform,shower,parking,neon,whistle,more_info,level,win,lose,draw,penalty);
				dtos.add(dto);
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(resultSet!=null)resultSet.close();
				if(preparedStatement!=null)preparedStatement.close();
				if(connection!=null)connection.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return dtos;
	}	//searchMatch()
	
	public ArrayList<CommentDto> matchComment(){
		
		ArrayList<CommentDto> dtos = new ArrayList<CommentDto>();
		
		String URL = "jdbc:mysql://localhost:3306/versus?useUnicode=true&characterEncoding=euc-kr";		
		String USER = "root";							
		String PASS="apmsetup";		

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");	
			connection = DriverManager.getConnection(URL, USER, PASS);
			String query = "SET NAMES euckr";
			Statement stat = connection.createStatement();
			stat.executeQuery(query);
			
			query = "SELECT * FROM comment JOIN team_info on comment.team_code=team_info.team_code";
			
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()){
				
				int match_num = resultSet.getInt("match_num");
				int team_code = resultSet.getInt("team_code");
				String team_name = resultSet.getString("team_name");
				String nickName = resultSet.getString("NICKNAME");
				Boolean application = resultSet.getBoolean("APPLICATION");
				String comment = resultSet.getString("COMMENT");
				CommentDto dto = new CommentDto(match_num,team_code,team_name,nickName,application,comment);
				dtos.add(dto);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(resultSet!=null)resultSet.close();
				if(preparedStatement!=null)preparedStatement.close();
				if(connection!=null)connection.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return dtos;
		
	}//matchComment
	
	public void applyMatch(int matchCode, int teamCode, String nickName){
		
		String URL = "jdbc:mysql://localhost:3306/versus?useUnicode=true&characterEncoding=euc-kr";		
		String USER = "root";							
		String PASS="apmsetup";		

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");	
			connection = DriverManager.getConnection(URL, USER, PASS);
			String query = "SET NAMES euckr";
			Statement stat = connection.createStatement();
			stat.executeQuery(query);
			
			query = "INSERT INTO comment(MATCH_NUM, TEAM_CODE, NICKNAME, APPLICATION, COMMENT) VALUES (?, ?, ?, ?, ?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, matchCode);	//쿼리문 ? 내용
			preparedStatement.setInt(2, teamCode);
			preparedStatement.setString(3, nickName);
			preparedStatement.setInt(4, 1);
			preparedStatement.setString(5, "경기 신청합니다.");
			preparedStatement.executeUpdate();
			
			/*query = "SELECT * FROM comment JOIN team_info on comment.team_code=team_info.team_code where "+
					"comment.MATCH_NUM = ?";
			preparedStatement = connection.prepareStatement(query);
			
			
			while(resultSet.next()){
				
				int match_num = resultSet.getInt("match_num");
				int team_code = resultSet.getInt("team_code");
				String team_name = resultSet.getString("team_name");
				String nickName = resultSet.getString("NICKNAME");
				Boolean application = resultSet.getBoolean("APPLICATION");
				String comment = resultSet.getString("COMMENT");
				CommentDto dto = new CommentDto(match_num,team_code,team_name,nickName,application,comment);
				dtos.add(dto);
			}*/
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(resultSet!=null)resultSet.close();
				if(preparedStatement!=null)preparedStatement.close();
				if(connection!=null)connection.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}//applyMatch()
	
	public ArrayList<FaqDto> faqGet(){
		
		String URL = "jdbc:mysql://localhost:3306/versus?useUnicode=true&characterEncoding=euc-kr";		
		String USER = "root";							
		String PASS="apmsetup";		

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		ArrayList<FaqDto> dtos = new ArrayList<FaqDto>();
		
		try{
			
			Class.forName("com.mysql.jdbc.Driver");	
			connection = DriverManager.getConnection(URL, USER, PASS);
			String query = "SET NAMES euckr";
			Statement stat = connection.createStatement();
			stat.executeQuery(query);
			
			query = "SELECT * FROM faq";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()){
				
				String faq_title = resultSet.getString("FAQ_TITLE");
				String faq_content = resultSet.getString("FAQ_CONTENT");
				FaqDto dto = new FaqDto(faq_title,faq_content);
				dtos.add(dto);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(resultSet!=null)resultSet.close();
				if(preparedStatement!=null)preparedStatement.close();
				if(connection!=null)connection.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return dtos;
	}//faqGet()
	
	public TeamDto teamInfo(int teamCode){
		
		String URL = "jdbc:mysql://localhost:3306/versus?useUnicode=true&characterEncoding=euc-kr";		
		String USER = "root";							
		String PASS="apmsetup";		

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		TeamDto dto = null;
		
		try{
			
			Class.forName("com.mysql.jdbc.Driver");	
			connection = DriverManager.getConnection(URL, USER, PASS);
			String query = "SET NAMES euckr";
			Statement stat = connection.createStatement();
			stat.executeQuery(query);
			
			query = "SELECT * FROM team_info WHERE TEAM_CODE=?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, teamCode);	//쿼리문 ? 내용
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()){
				int team_Code = resultSet.getInt("TEAM_CODE");
				String team_name = resultSet.getString("TEAM_NAME");
				String leader_id = resultSet.getString("LEADER_ID");
				String second_leader_id = resultSet.getString("SECOND_LEADER_ID");
				String phone = resultSet.getString("PHONE");
				String region = resultSet.getString("REGION");
				String uniform = resultSet.getString("UNIFORM");
				int level = resultSet.getInt("LEVEL");
				int win = resultSet.getInt("WIN");
				int lose = resultSet.getInt("LOSE");
				int draw = resultSet.getInt("DRAW");
				int penalty = resultSet.getInt("PENALTY");
				dto = new TeamDto(team_Code,team_name,leader_id,second_leader_id,phone,region,uniform,
						level,win,lose,draw,penalty);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(resultSet!=null)resultSet.close();
				if(preparedStatement!=null)preparedStatement.close();
				if(connection!=null)connection.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return dto;
	}//teamInfo(teamCode)
	
	public ArrayList<TeamDto> teamInfo(){
		
		String URL = "jdbc:mysql://localhost:3306/versus?useUnicode=true&characterEncoding=euc-kr";		
		String USER = "root";							
		String PASS="apmsetup";		

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		ArrayList<TeamDto> dtos = new ArrayList<TeamDto>();
		
		try{
			
			Class.forName("com.mysql.jdbc.Driver");	
			connection = DriverManager.getConnection(URL, USER, PASS);
			String query = "SET NAMES euckr";
			Statement stat = connection.createStatement();
			stat.executeQuery(query);
			
			query = "SELECT * FROM team_info";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()){
				int team_Code = resultSet.getInt("TEAM_CODE");
				String team_name = resultSet.getString("TEAM_NAME");
				String leader_id = resultSet.getString("LEADER_ID");
				String second_leader_id = resultSet.getString("SECOND_LEADER_ID");
				String phone = resultSet.getString("PHONE");
				String region = resultSet.getString("REGION");
				String uniform = resultSet.getString("UNIFORM");
				int level = resultSet.getInt("LEVEL");
				int win = resultSet.getInt("WIN");
				int lose = resultSet.getInt("LOSE");
				int draw = resultSet.getInt("DRAW");
				int penalty = resultSet.getInt("PENALTY");
				TeamDto dto = new TeamDto(team_Code,team_name,leader_id,second_leader_id,phone,region,uniform,
						level,win,lose,draw,penalty);
				dtos.add(dto);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(resultSet!=null)resultSet.close();
				if(preparedStatement!=null)preparedStatement.close();
				if(connection!=null)connection.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return dtos;
	}//teamInfo()
}
