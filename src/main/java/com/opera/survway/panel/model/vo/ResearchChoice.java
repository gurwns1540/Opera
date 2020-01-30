/**
 * 
 */
package com.opera.survway.panel.model.vo;

/**
 * @author Sooo
 * 리서치 정보 불러오기위한 vo 클래스 (진행중인 설문조사)
 */
public class ResearchChoice {
	private int rchoiceOrder;
	private String rchoiceContext;
	
	public ResearchChoice() {}
	public ResearchChoice(int rchoiceOrder, String rchoiceContext) {
		super();
		this.rchoiceOrder = rchoiceOrder;
		this.rchoiceContext = rchoiceContext;
	}
	public int getRchoiceOrder() {
		return rchoiceOrder;
	}
	public void setRchoiceOrder(int rchoiceOrder) {
		this.rchoiceOrder = rchoiceOrder;
	}
	public String getRchoiceContext() {
		return rchoiceContext;
	}
	public void setRchoiceContext(String rchoiceContext) {
		this.rchoiceContext = rchoiceContext;
	}
	@Override
	public String toString() {
		return "ResearchChoice [rchoiceOrder=" + rchoiceOrder + ", rchoiceContext=" + rchoiceContext + "]";
	}
}
