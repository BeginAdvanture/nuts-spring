package com.vam.model;

public class OrderItemDTO {

	/* 주문 번호 */
	private String orderId;
	
	/* 상품 번호 */
    private int pillId;
    
	/* 주문 수량 */
    private int pillCount;
    
	/* vam_orderItem 기본키 */
    private int orderItemId;
    
	/* 상품 한 개 가격 */
    private int pillPrice;
    
	/* 상품 할인 율 */
    private double pillDiscount;
    
	/* 상품 한개 구매 시 획득 포인트 */
    private int savePoint;
    
	/* DB테이블 존재 하지 않는 데이터 */
    
	/* 할인 적용된 가격 */
    private int salePrice;
    
	/* 총 가격(할인 적용된 가격 * 주문 수량) */
    private int totalPrice;
    
	/* 총 획득 포인트(상품 한개 구매 시 획득 포인트 * 수량) */
    private int totalSavePoint;

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public int getpillId() {
		return pillId;
	}

	public void setpillId(int pillId) {
		this.pillId = pillId;
	}

	public int getpillCount() {
		return pillCount;
	}

	public void setpillCount(int pillCount) {
		this.pillCount = pillCount;
	}

	public int getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}

	public int getpillPrice() {
		return pillPrice;
	}

	public void setpillPrice(int pillPrice) {
		this.pillPrice = pillPrice;
	}

	public double getpillDiscount() {
		return pillDiscount;
	}

	public void setpillDiscount(double pillDiscount) {
		this.pillDiscount = pillDiscount;
	}

	public int getSavePoint() {
		return savePoint;
	}

	public void setSavePoint(int savePoint) {
		this.savePoint = savePoint;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getTotalSavePoint() {
		return totalSavePoint;
	}

	public void setTotalSavePoint(int totalSavePoint) {
		this.totalSavePoint = totalSavePoint;
	}

	@Override
	public String toString() {
		return "OrderItemDTO [orderId=" + orderId + ", pillId=" + pillId + ", pillCount=" + pillCount + ", orderItemId="
				+ orderItemId + ", pillPrice=" + pillPrice + ", pillDiscount=" + pillDiscount + ", savePoint="
				+ savePoint + ", salePrice=" + salePrice + ", totalPrice=" + totalPrice + ", totalSavePoint="
				+ totalSavePoint + "]";
	}
	
	public void initSaleTotal() {
		this.salePrice = (int) (this.pillPrice * (1-this.pillDiscount));
		this.totalPrice = this.salePrice*this.pillCount;
		this.savePoint = (int)(Math.floor(this.salePrice*0.05));
		this.totalSavePoint =this.savePoint * this.pillCount;
	}		
    
    
	
}
