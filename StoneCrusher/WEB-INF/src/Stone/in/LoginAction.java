package Stone.in;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import flexjson.JSONSerializer;

public class LoginAction extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpServletRequest request;
	private String username;
	private String password;
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	Map<String,String> map = new HashMap<String,String>();
	String jsondata="";

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
	
	public String execute(){
		JSONSerializer jss = new JSONSerializer();
		if(username.equalsIgnoreCase("admin")&&password.equalsIgnoreCase("admin")){
		
			map.put("resultData", "success");
			jsondata = jss.serialize(map);
			request.setAttribute("jsondata", jsondata);
		}
		else{
			map.put("resultData", "Invalid UserName and Password !");
			jsondata = jss.serialize(map);
			request.setAttribute("jsondata", jsondata);
		}
		return "jsondata";
	}

}
