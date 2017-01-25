package com.versus.dto;

public class CommentDto {
	
	int match_num;
	int team_code;
	String team_name;
	String nickName;
	Boolean application;
	String comment;
	
	public CommentDto(){
		
	}
	
	public CommentDto(int match_num, int team_code, String team_name, String nickName, Boolean application, String comment){
		this.match_num = match_num;
		this.team_code = team_code;
		this.team_name = team_name;
		this.nickName = nickName;
		this.application = application;
		this.comment = comment;
	}

	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}

	public int getMatch_num() {
		return match_num;
	}

	public void setMatch_num(int match_num) {
		this.match_num = match_num;
	}

	public int getTeam_code() {
		return team_code;
	}

	public void setTeam_code(int team_code) {
		this.team_code = team_code;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Boolean getApplication() {
		return application;
	}

	public void setApplication(Boolean application) {
		this.application = application;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
	
}
