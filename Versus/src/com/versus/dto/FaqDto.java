package com.versus.dto;

public class FaqDto {
	String faq_title;
	String faq_content;
	
	public FaqDto(){
		
	}
	
	public FaqDto(String faq_title, String faq_content){
		this.faq_title = faq_title;
		this.faq_content = faq_content;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

}
