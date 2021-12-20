package Stone.in;

import java.util.ArrayList;

import DBCon.QueryProcess;

import com.opensymphony.xwork2.ActionSupport;

public class DispMaterial extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String matname;
	private String amount;
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	ArrayList<DispMaterial>list;
	public ArrayList<DispMaterial> getList() {
		return list;
	}
	public void setList(ArrayList<DispMaterial> list) {
		this.list = list;
	}
	public String getMatname() {
		return matname;
	}
	public void setMatname(String matname) {
		this.matname = matname;
	}
	public String execute(){
		ArrayList<DispMaterial>al= new QueryProcess().dispmat();
		list=al;
		return "success";
	}
}
