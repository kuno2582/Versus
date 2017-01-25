package com.versus.dto;

public class InputMemberInfoDto {
	
	String id;
	String nickName;
	String region;
	int teamCode;
	boolean leader;
	boolean second_leader;
	
	public InputMemberInfoDto(){
		
	}
	
	public InputMemberInfoDto(String id, String nickName, String region, int teamCode, boolean leader, boolean second_leader){
		this.id = id;
		this.nickName = nickName;
		this.region = region;
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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public int getTeamCode() {
		return teamCode;
	}

	public void setTeamCode(int teamCode) {
		this.teamCode = teamCode;
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
