package Stone.in;

import java.util.ArrayList;

import DBCon.QueryProcess;
import Stone.in.been.WagesDetails;

import com.opensymphony.xwork2.ActionSupport;

public class DialyWages extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String getFromdate() {
		return fromdate;
	}

	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}

	public String getTodate() {
		return todate;
	}

	public void setTodate(String todate) {
		this.todate = todate;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	private String fromdate;
	private String todate;
	private String custId;
	private String options;
	ArrayList<WagesDetails> list;
	
	public ArrayList<WagesDetails> getList() {
		return list;
	}

	public void setList(ArrayList<WagesDetails> list) {
		this.list = list;
	}

	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public String execute(){
		ArrayList<WagesDetails> al = new QueryProcess().details(this);
		list = al;
		return "success";
	}
	
	

}
