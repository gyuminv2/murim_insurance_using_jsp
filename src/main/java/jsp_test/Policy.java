package jsp_test;

public class Policy {
	private int policyId;
	private String type;
	private int premium;
	private String customerLoginId;
	
	public int getPolicyId() {
		return policyId;
	}
	public void setPolicyId(int policyId) {
		this.policyId = policyId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPremium() {
		return premium;
	}
	public void setPremium(int premium) {
		this.premium = premium;
	}
	public String getCustomerLoginId() {
		return customerLoginId;
	}
	public void setCustomerLoginId(String customerLoginId) {
		this.customerLoginId = customerLoginId;
	}
	
	
}