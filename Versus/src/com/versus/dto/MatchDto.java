package com.versus.dto;

import java.sql.Timestamp;

public class MatchDto {
	int match_num;
	int match_progress;
	int team_code;
	String team_name;
	int opponent_code;
	String match_region;
	Timestamp match_date;
	String match_leader_nickname;
	String match_phone;
	String uniform;
	Boolean shower;
	Boolean parking;
	Boolean neon;
	Boolean whistle;
	String more_info;
	int level;
	int win;
	int lose;
	int draw;
	int penalty;
	
	public MatchDto(){
		
	}
	
	public MatchDto(int match_num,int match_progress,int team_code,String team_name,int opponent_code,String match_region,Timestamp match_date,
	String match_leader_nickname,String phone,String uniform,Boolean shower,Boolean parking,Boolean neon,Boolean whistle,String more_info,
	int level,int win,int lose,int draw,int penalty){
		this.match_num = match_num;
		this.match_progress = match_progress; 
		this.team_code = team_code;
		this.opponent_code = opponent_code;
		this.match_region = match_region;
		this.match_date = match_date;
		this.match_leader_nickname = match_leader_nickname;
		this.match_phone = phone;
		this.uniform = uniform;
		this.shower = shower;
		this.parking = parking;
		this.neon = neon;
		this.whistle = whistle;
		this.more_info = more_info;
		this.team_name = team_name;
		this.level = level;
		this.win = win;
		this.lose = lose;
		this.draw = draw;
		this.penalty = penalty;
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

	public int getMatch_progress() {
		return match_progress;
	}

	public void setMatch_progress(int match_progress) {
		this.match_progress = match_progress;
	}

	public int getTeam_code() {
		return team_code;
	}

	public void setTeam_code(int team_code) {
		this.team_code = team_code;
	}

	public int getOpponent_code() {
		return opponent_code;
	}

	public void setOpponent_code(int opponent_code) {
		this.opponent_code = opponent_code;
	}

	public String getMatch_region() {
		return match_region;
	}

	public void setMatch_region(String match_region) {
		this.match_region = match_region;
	}

	public Timestamp getMatch_date() {
		return match_date;
	}

	public void setMatch_date(Timestamp match_date) {
		this.match_date = match_date;
	}

	public String getMatch_leader_nickname() {
		return match_leader_nickname;
	}

	public void setMatch_leader_nickname(String match_leader_nickname) {
		this.match_leader_nickname = match_leader_nickname;
	}

	public String getMatch_phone() {
		return match_phone;
	}

	public void setMatch_phone(String match_phone) {
		this.match_phone = match_phone;
	}

	public String getUniform() {
		return uniform;
	}

	public void setUniform(String uniform) {
		this.uniform = uniform;
	}

	public Boolean getShower() {
		return shower;
	}

	public void setShower(Boolean shower) {
		this.shower = shower;
	}

	public Boolean getParking() {
		return parking;
	}

	public void setParking(Boolean parking) {
		this.parking = parking;
	}

	public Boolean getNeon() {
		return neon;
	}

	public void setNeon(Boolean neon) {
		this.neon = neon;
	}

	public Boolean getWhistle() {
		return whistle;
	}

	public void setWhistle(Boolean whistle) {
		this.whistle = whistle;
	}

	public String getMore_info() {
		return more_info;
	}

	public void setMore_info(String more_info) {
		this.more_info = more_info;
	}
	
	
}
