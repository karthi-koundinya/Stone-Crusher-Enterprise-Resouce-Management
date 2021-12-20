package Stone.in;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import DBCon.QueryProcess;

import com.opensymphony.xwork2.ActionSupport;

public class DeleteEmployee extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpServletRequest request;
	private String empid;

	public String getEmpid() {
		return empid;
	}

	public void setEmpid(String empid) {
		this.empid = empid;
	}

	
	public String execute(){
		new QueryProcess().deleteEmp(empid.toString());
		return "success";
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}


}
