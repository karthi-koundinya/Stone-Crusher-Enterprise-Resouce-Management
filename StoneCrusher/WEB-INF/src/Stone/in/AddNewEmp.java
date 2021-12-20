package Stone.in;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import DBCon.QueryProcess;

import com.opensymphony.xwork2.ActionSupport;

public class AddNewEmp extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpServletRequest request;
	private String dateofjoin;
	private String empid;
	private String empname;
	private String phoneNumber;
	private String designation;
	private String address;
	private String email;
	private String salary;

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}

	public String getDateofjoin() {
		return dateofjoin;
	}

	public void setDateofjoin(String dateofjoin) {
		this.dateofjoin = dateofjoin;
	}

	public String getEmpid() {
		return empid;
	}

	public void setEmpid(String empid) {
		this.empid = empid;
	}

	public String getEmpname() {
		return empname;
	}

	public void setEmpname(String empname) {
		this.empname = empname;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
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

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String execute(){
		new QueryProcess().addEmp(this);
		return "success";
	}
	

}
