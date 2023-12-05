package jsp_test;

public class Customer {
	private String name;
	private int age;
	private String gender;
	private int MartialArtLevelID;
	private int ClanAffiliationID;
	private String customerLoginID;
	private String customerPassword;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getMartialArtLevelID() {
		return MartialArtLevelID;
	}
	public void setMartialArtLevelID(int martialArtLevelID) {
		MartialArtLevelID = martialArtLevelID;
	}
	public int getClanAffiliationID() {
		return ClanAffiliationID;
	}
	public void setClanAffiliationID(int clanAffiliationID) {
		ClanAffiliationID = clanAffiliationID;
	}
	public String getCustomerLoginID() {
		return customerLoginID;
	}
	public void setCustomerLoginID(String customerLoginID) {
		this.customerLoginID = customerLoginID;
	}
	public String getCustomerPassword() {
		return customerPassword;
	}
	public void setCustomerPassword(String customerPassword) {
		this.customerPassword = customerPassword;
	}
}