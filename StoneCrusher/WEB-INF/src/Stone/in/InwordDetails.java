package Stone.in;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import DBCon.QueryProcess;

import com.opensymphony.xwork2.ActionSupport;

public class InwordDetails extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpServletRequest request;
	private String bookingDate;
	private String materialName;
	private String rateTone;
	private String quantity;

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	public String getRateTone() {
		return rateTone;
	}

	public void setRateTone(String rateTone) {
		this.rateTone = rateTone;
	}

	public String execute(){
		new QueryProcess().inward(this);
		return "success";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		
		this.request = request;
	}


}
