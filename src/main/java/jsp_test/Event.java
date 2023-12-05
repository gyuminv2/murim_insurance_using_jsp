package jsp_test;

public class Event {
	private int eventID;
	private String title;
	private String customerLoginID;
	private String content;
	private String eventDate;
	private String relatedClan;
	private String injured;
	public int getEventID() {
		return eventID;
	}
	public void setEventID(int eventID) {
		this.eventID = eventID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCustomerLoginID() {
		return customerLoginID;
	}
	public void setCustomerLoginID(String customerLoginID) {
		this.customerLoginID = customerLoginID;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEventDate() {
		return eventDate;
	}
	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}
	public String getRelatedClan() {
		return relatedClan;
	}
	public void setRelatedClan(String relatedClan) {
		this.relatedClan = relatedClan;
	}
	public String getInjured() {
		return injured;
	}
	public void setInjured(String injured) {
		this.injured = injured;
	}
	
	
	
}