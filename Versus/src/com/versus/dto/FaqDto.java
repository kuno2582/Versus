package com.versus.dto;

public class FaqDto {
	String content;
	
	public FaqDto(){
		
	}
	
	public FaqDto(String content){
		this.content = content;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
