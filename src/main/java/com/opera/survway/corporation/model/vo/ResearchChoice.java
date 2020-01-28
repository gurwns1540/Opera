package com.opera.survway.corporation.model.vo;

import java.util.List;

public class ResearchChoice {
	private int choiceNo;
	private int choiceOrder;
	private String choiceContext;
	
	public ResearchChoice() {}

	public ResearchChoice(int choiceNo, int choiceOrder, String choiceContext) {
		super();
		this.choiceNo = choiceNo;
		this.choiceOrder = choiceOrder;
		this.choiceContext = choiceContext;
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

	@Override
	public String toString() {
		return "ResearchChoice [choiceNo=" + choiceNo + ", choiceOrder=" + choiceOrder + ", choiceContext="
				+ choiceContext + "]";
	}

}
