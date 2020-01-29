package com.opera.survway.corporation.model.vo;

import java.util.List;

public class ResearchChoice {
	private int choiceNo;
	private int choiceOrder;
	private String choiceContext;
	private int rquestionNo;
	
	public ResearchChoice() {}

	public ResearchChoice(int choiceNo, int choiceOrder, String choiceContext, int rquestionNo) {
		super();
		this.choiceNo = choiceNo;
		this.choiceOrder = choiceOrder;
		this.choiceContext = choiceContext;
		this.rquestionNo = rquestionNo;
	}

	public int getChoiceNo() {
		return choiceNo;
	}

	public void setChoiceNo(int choiceNo) {
		this.choiceNo = choiceNo;
	}

	public int getChoiceOrder() {
		return choiceOrder;
	}

	public void setChoiceOrder(int choiceOrder) {
		this.choiceOrder = choiceOrder;
	}

	public String getChoiceContext() {
		return choiceContext;
	}

	public void setChoiceContext(String choiceContext) {
		this.choiceContext = choiceContext;
	}

	public int getRquestionNo() {
		return rquestionNo;
	}

	public void setRquestionNo(int rquestionNo) {
		this.rquestionNo = rquestionNo;
	}

	@Override
	public String toString() {
		return "ResearchChoice [choiceNo=" + choiceNo + ", choiceOrder=" + choiceOrder + ", choiceContext="
				+ choiceContext + ", rquestionNo=" + rquestionNo + "]";
	}

}
