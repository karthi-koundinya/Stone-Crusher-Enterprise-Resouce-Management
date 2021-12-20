package Stone.in;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import DBCon.QueryProcess;

import com.opensymphony.xwork2.ActionSupport;

public class EmployeeDetails extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpServletRequest request;
	private String dateofjoin;
	private String empid;
	private String empname;
	private String phone;
	private String designation;
	private String address;
	private String email;
	private String salary;
	
	ArrayList<EmployeeDetails> list;

	
	public String execute(){
		ArrayList<EmployeeDetails> li = new QueryProcess().getEmployee();
		list = li;
		return "success";
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public ArrayList<EmployeeDetails> getList() {
		return list;
	}

	public void setList(ArrayList<EmployeeDetails> list) {
		this.list = list;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}



}
