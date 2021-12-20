package Stone.in;

import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import DBCon.QueryProcess;

public class MaterialDetails extends HttpServlet implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String materialId;
	private String bookingDate;
	private String materialName;
	private String rateTone;
	private String quant;


	public String getQuant() {
		return quant;
	}

	public void setQuant(String quant) {
		this.quant = quant;
	}


	ArrayList<MaterialDetails> list;
	
	public ArrayList<MaterialDetails> getList() {
		return list;
	}

	public void setList(ArrayList<MaterialDetails> list) {
		this.list = list;
	}

	public String getMaterialId() {
		return materialId;
	}

	public void setMaterialId(String materialId) {
		this.materialId = materialId;
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
		ArrayList<MaterialDetails> li = new QueryProcess().checkMaterial(this);
		list = li;
		return "success";
	}

	
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		
		
	}



}
