package Stone.in.been;

import java.util.Date;
import java.util.List;

public class MaterialBeen {
	
	private List<String> roomType;
	private List<String> noOfRooms;
	private List<String> noOfDays;
	private List<String> amount;
	private String loadingPoint;
	private double totalAmount;
	public String getVehicleId() {
		return vehicleId;
	}
	public void setVehicleId(String vehicleId) {
		this.vehicleId = vehicleId;
	}
	public double getKilometer() {
		return kilometer;
	}
	public void setKilometer(double kilometer) {
		this.kilometer = kilometer;
	}

	private String bookingDate;
	private String vehicleId;
	private double kilometer;
	




	public String getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}
	public List<String> getRoomType() {
		return roomType;
	}
	public void setRoomType(List<String> roomType) {
		this.roomType = roomType;
	}
	public List<String> getNoOfRooms() {
		return noOfRooms;
	}
	public void setNoOfRooms(List<String> noOfRooms) {
		this.noOfRooms = noOfRooms;
	}
	public List<String> getNoOfDays() {
		return noOfDays;
	}
	public void setNoOfDays(List<String> noOfDays) {
		this.noOfDays = noOfDays;
	}
	public List<String> getAmount() {
		return amount;
	}
	public void setAmount(List<String> amount) {
		this.amount = amount;
	}

	public String getLoadingPoint() {
		return loadingPoint;
	}
	public void setLoadingPoint(String loadingPoint) {
		this.loadingPoint = loadingPoint;
	}
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	private int cid;
	private String name;
	private String phoneNumber;
	private String address;
	private String email;



	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	

}
