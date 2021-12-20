package Stone.in;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import DBCon.QueryProcess;

import com.opensymphony.xwork2.ActionSupport;

import flexjson.JSONSerializer;

public class GetAmount extends ActionSupport implements ServletRequestAware  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String amnt;
	HttpServletRequest request;
	
	Map<String,String> map = new HashMap<String,String>();
	String jsondata="";
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAmnt() {
		return amnt;
	}
	public void setAmnt(String amnt) {
		this.amnt = amnt;
	}
	
	public String execute(){
        ArrayList<GetAmount> list=new QueryProcess().getamnt(this);
		
		
		JSONSerializer jsoner = new JSONSerializer();
		
		if(list.isEmpty()){
				map.put("GetDetails","no data found");
				jsondata=jsoner.serialize(map);
				request.setAttribute("jsondata", jsondata);
		}
		else
		{
			map.put("GetDetails", jsoner.serialize(list));
			
			jsondata=jsoner.serialize(map);
			request.setAttribute("jsondata", jsondata);
		}
		return "jsondata";
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
		
	}
}
