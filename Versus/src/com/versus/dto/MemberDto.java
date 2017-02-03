package com.versus.dto;

import java.sql.Timestamp;

public class MemberDto {
	String id;
	String pw;
	String nickName;
	String region;
	Timestamp signupDate;
	int teamCode;
	String mail;
	boolean leader;
	boolean second_leader;
	
	public MemberDto(){
		
	}
	
	public MemberDto(String id, String nickName, String region, Timestamp signupDate, int teamCode, String mail,
			boolean leader, boolean second_leader) {
		super();
		this.id = id;
		this.nickName = nickName;
		this.region = region;
		this.signupDate = signupDate;
		this.teamCode = teamCode;
		this.mail = mail;
		this.leader = leader;
		this.second_leader = second_leader;
	}



	public MemberDto(String id, String pw, String nickName, String region,
			Timestamp signupDate, int teamCode, String mail, boolean leader, boolean second_leader){
		this.id = id;
		this.pw = pw;
		this.nickName = nickName;
		this.region = region;
		this.signupDate = signupDate;
		this.teamCode = teamCode;
		this.leader = leader;
		this.second_leader = second_leader;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickname) {
		this.nickName = nickname;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public Timestamp getSignupDate() {
		return signupDate;
	}

	public void setSignupDate(Timestamp signupDate) {
		this.signupDate = signupDate;
	}

	public int getTeamCode() {
		return teamCode;
	}

	public void setTeamCode(int teamCode) {
		this.teamCode = teamCode;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public boolean isLeader() {
		return leader;
	}

	public void setLeader(boolean leader) {
		this.leader = leader;
	}

	public boolean isSecond_leader() {
		return second_leader;
	}

	public void setSecond_leader(boolean second_leader) {
		this.second_leader = second_leader;
	}
	
	
}
