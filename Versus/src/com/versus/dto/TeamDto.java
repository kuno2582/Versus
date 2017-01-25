package com.versus.dto;

public class TeamDto {
	int team_code;
	String team_name;
	String leader_name;
	String leader_phone;
	String region;
	String uniform;
	int level;
	int win;
	int lose;
	int draw;
	int penalty;
	
	public TeamDto(){
		
	}
	
	public TeamDto(int team_code, String team_name,String leader_name,String leader_phone,String region,String uniform,
			int level,int win,int lose,int draw,int penalty){
		this.team_code = team_code;
		this.team_name = team_name;
		this.leader_name = leader_name;
		this.leader_phone = leader_phone;
		this.region = region;
		this.uniform = uniform;
		this.level = level;
		this.win = win;
		this.lose = lose;
		this.draw = draw;
		this.penalty = penalty;
	}

	public int getTeam_code() {
		return team_code;
	}

	public void setTeam_code(int team_code) {
		this.team_code = team_code;
	}

	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}

	public String getLeader_name() {
		return leader_name;
	}

	public void setLeader_name(String leader_name) {
		this.leader_name = leader_name;
	}

	public String getLeader_phone() {
		return leader_phone;
	}

	public void setLeader_phone(String leader_phone) {
		this.leader_phone = leader_phone;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getUniform() {
		return uniform;
	}

	public void setUniform(String uniform) {
		this.uniform = uniform;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getWin() {
		return win;
	}

	public void setWin(int win) {
		this.win = win;
	}

	public int getLose() {
		return lose;
	}

	public void setLose(int lose) {
		this.lose = lose;
	}

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}

	public int getPenalty() {
		return penalty;
	}

	public void setPenalty(int penalty) {
		this.penalty = penalty;
	}
	
	
}
