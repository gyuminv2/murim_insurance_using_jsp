package jsp_test;

public class Claim {
	private int claimID;
	private String customerLoginID;
	private String claimDate;
	private int amount;
	private String reason;
	private boolean result;
	
	public int getClaimID() {
		return claimID;
	}
	public void setClaimID(int claimID) {
		this.claimID = claimID;
	}
	public String getCustomerLoginID() {
		return customerLoginID;
	}
	public void setCustomerLoginID(String customerLoginID) {
		this.customerLoginID = customerLoginID;
	}
	public String getClaimDate() {
		return claimDate;
	}
	public void setClaimDate(String claimDate) {
		this.claimDate = claimDate;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public boolean getResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
}