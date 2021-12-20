package Stone.in;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import DBCon.QueryProcess;

import com.opensymphony.xwork2.ActionSupport;

public class DeletItems extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpServletRequest request;
	private String id;
	
	

	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}


	public String execute(){
		new QueryProcess().deleteitem(id.toString());
		
		return "success";
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}

}
