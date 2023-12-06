package jsp_test;

public class Payment {
	private int paymentID;
	private String customerLoginID;
	private int policyID;
	private int claimID;
	private int amount;
	
	public int getPaymentID() {
		return paymentID;
	}
	public void setPaymentID(int paymentID) {
		this.paymentID = paymentID;
	}
	public String getCustomerLoginID() {
		return customerLoginID;
	}
	public void setCustomerLoginID(String customerLoginID) {
		this.customerLoginID = customerLoginID;
	}
	public int getPolicyID() {
		return policyID;
	}
	public void setPolicyID(int policyID) {
		this.policyID = policyID;
	}
	public int getClaimID() {
		return claimID;
	}
	public void setClaimID(int claimID) {
		this.claimID = claimID;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
}