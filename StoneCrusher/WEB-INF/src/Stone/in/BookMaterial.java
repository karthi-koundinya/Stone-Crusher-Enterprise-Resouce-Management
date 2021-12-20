package Stone.in;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import DBCon.QueryProcess;
import Stone.in.been.MaterialBeen;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class BookMaterial extends ActionSupport implements ModelDriven<MaterialBeen>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpServletRequest request;
	private MaterialBeen been;



	
	public MaterialBeen getBeen() {
		return been;
	}
	public void setBeen(MaterialBeen been) {
		this.been = been;
	}
	public String execute(){
		
		int x = new QueryProcess().addMaterial(been);
		
		if(x==0)
		return "success";
		else
		return "failure";
		
	}
	@Override
	public MaterialBeen getModel() {
		been = new MaterialBeen();
		return been;
	}
	

}
