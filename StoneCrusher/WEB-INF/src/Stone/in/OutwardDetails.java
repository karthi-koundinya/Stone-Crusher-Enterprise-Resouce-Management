package Stone.in;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import DBCon.QueryProcess;

import com.opensymphony.xwork2.ActionSupport;

public class OutwardDetails extends ActionSupport implements ServletRequestAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String maderialId;
	private String customerId;
	private String materialName;
	private String quantity;
	private String amount;
	private String total;
	HttpServletRequest request;
	public String getMaderialId() {
		return maderialId;
	}

	public void setMaderialId(String maderialId) {
		this.maderialId = maderialId;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public ArrayList<OutwardDetails> getList() {
		return list;
	}

	public void setList(ArrayList<OutwardDetails> list) {
		this.list = list;
	}

	ArrayList<OutwardDetails> list;
	
	public String execute(){
		ArrayList<OutwardDetails> li = new QueryProcess().outward(this);
		list = li;
		return "success";
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		
		this.request = request;
	}



}
