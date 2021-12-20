package DBCon;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import Stone.in.AddNewEmp;
import Stone.in.DialyWages;
import Stone.in.DispMaterial;
import Stone.in.EmployeeDetails;
import Stone.in.GetAmount;
import Stone.in.InwordDetails;
import Stone.in.MaterialDetails;
import Stone.in.OutwardDetails;
import Stone.in.UpdateEmpDetails;
import Stone.in.UppdateEmpDets;
import Stone.in.been.MaterialBeen;
import Stone.in.been.WagesDetails;


public class QueryProcess {
	Connection con = null;
	PreparedStatement pred = null;
	SimpleDateFormat format = new SimpleDateFormat( "dd/MM/yyyy" ); 
	public int addMaterial(MaterialBeen been){
		int x = 0;
		try{
			
			con = new MyConnection().connect();
			
			
			
			
			String sql = "insert into sales(customerId,materialName,quantity,amount,total)values(?,?,?,?,?)";
			 pred = con.prepareStatement(sql);
			con.setAutoCommit(false);
			
			
			for(int i=0;i<been.getRoomType().size();i++){
				
				pred.setInt(1, been.getCid());
				pred.setString(2, been.getRoomType().get(i));
				pred.setString(3, been.getNoOfRooms().get(i));
				Connection cond = new MyConnection().connect();
				System.out.println(been.getRoomType().toString().substring(1,been.getRoomType().toString().length()-1));
				String sqls = "select * from inwardmaterial where MaterialName=?";
				PreparedStatement predd = cond.prepareStatement(sqls);
				System.out.println(been.getRoomType().get(i));
				System.out.println(been.getRoomType().toString().substring(1,been.getRoomType().toString().length()-1));
				predd.setString(1, been.getRoomType().get(i).toString().trim());
				ResultSet resd = predd.executeQuery();
				if(resd.next()){
					int itemavailable = Integer.parseInt(resd.getString(5));
					int givenitem = Integer.parseInt(been.getNoOfRooms().get(i).toString().trim());
					
					if(givenitem<=itemavailable){
						int bal = itemavailable - givenitem;
						Statement st = con.createStatement();
						st.executeUpdate("update inwardmaterial set quantity='"+bal+"' where MaterialName='"+been.getRoomType().toString().substring(1,been.getRoomType().toString().length()-1)+"'");
						
						pred.setString(4, been.getNoOfDays().get(i));
						pred.setString(5, been.getAmount().get(i));				
						pred.addBatch();
					}
					else{
						x = 1;
					}
					
				}
				else{
					
					x = 1;
				}	
			}
			pred.executeBatch();
			
			java.util.Date myDate = format.parse(been.getBookingDate()); 
			java.sql.Date sqlDate = new java.sql.Date( myDate.getTime() );
			String sql1 = "insert into customer values(?,?,?,?,?,?,?,?,?,?)";
			pred = con.prepareStatement(sql1);
			pred.setInt(1, been.getCid());
			pred.setString(2, been.getName());
			pred.setString(3, been.getPhoneNumber());
			pred.setString(4, been.getAddress());
			pred.setString(5, been.getEmail());
			pred.setString(6,been.getLoadingPoint());
			pred.setDouble(7, been.getTotalAmount());
			pred.setDate(8, sqlDate);
			pred.setString(9, been.getVehicleId());
			pred.setDouble(10, been.getKilometer());
			pred.executeUpdate();
			
		
			con.commit();
			con.close();

		}
		catch(Exception e){
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			System.out.println(e);
		}
		finally{
			try {
				con.close();
				pred.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
			return x;
	}
	public ArrayList<WagesDetails> details(DialyWages wage){
		ArrayList<WagesDetails> list = new ArrayList<WagesDetails>();
		try{
			con = new MyConnection().connect();
			if(wage.getOptions().toString().endsWith("date")){
				
			System.out.println(wage.getTodate());
			String sql = "SELECT customer.*, sales.* FROM customer  RIGHT JOIN sales ON customer.customerId = sales.customerId where customer.date BETWEEN ? AND ?";
			PreparedStatement pred = con.prepareStatement(sql);
			pred.setString(1,wage.getFromdate());
			pred.setString(2, wage.getTodate());
			ResultSet res = pred.executeQuery();
			String prevData = "";
			
			while(res.next()){
				WagesDetails dialy = new WagesDetails();
				dialy.setCustomerId(res.getString(1));
				dialy.setName(res.getString(2));
				dialy.setContact(res.getString(3));
				dialy.setAddress(res.getString(4));
				dialy.setEmail(res.getString(5));
				dialy.setLoadingPoint(res.getString(6));
				dialy.setTotalAmount(res.getString(7));
				dialy.setDate(res.getString(8));
				dialy.setVehicleId(res.getString(9));
				dialy.setKilometer(res.getString(10));
				dialy.setMaterialName(res.getString(13));
				dialy.setQuantity(res.getString(14));
				dialy.setAmount(res.getString(15));
				dialy.setTotal(res.getString(16));
				
				list.add(dialy);
				
			}
			}
			else{
				String sql = "SELECT customer.*, sales.* FROM customer LEFT JOIN sales ON customer.customerId = sales.customerId where customer.customerId=?";
				PreparedStatement pred = con.prepareStatement(sql);
				pred.setString(1,wage.getCustId());
				
				ResultSet res = pred.executeQuery();
				String prevData = "";
				
				while(res.next()){
					WagesDetails dialy = new WagesDetails();
					dialy.setCustomerId(res.getString(1));
					dialy.setName(res.getString(2));
					dialy.setContact(res.getString(3));
					dialy.setAddress(res.getString(4));
					dialy.setEmail(res.getString(5));
					dialy.setLoadingPoint(res.getString(6));
					dialy.setTotalAmount(res.getString(7));
					dialy.setDate(res.getString(8));
					dialy.setVehicleId(res.getString(9));
					dialy.setKilometer(res.getString(10));
					dialy.setMaterialName(res.getString(13));
					dialy.setQuantity(res.getString(14));
					dialy.setAmount(res.getString(15));
					dialy.setTotal(res.getString(16));
					
					list.add(dialy);
					
				}
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return list;
		
	}
	
	
	public void inward(InwordDetails in){
		
		try{
			
			Connection cons = new MyConnection().connect();
			String sqs = "select * from inwardmaterial where MaterialName=?";
			PreparedStatement preds = cons.prepareStatement(sqs);
			preds.setString(1, in.getMaterialName());
			
			ResultSet res = preds.executeQuery();
			if(res.next()){
				con = new MyConnection().connect();
				int x = Integer.parseInt(res.getString(5));
				int y = Integer.parseInt(in.getQuantity());
				int z = x+y;
				
				String sql = "update inwardmaterial set quantity=?,amount=?";
				PreparedStatement  pre = con.prepareStatement(sql);
				pre.setString(1, Integer.toString(z));
				
				pre.setString(2, in.getRateTone());
				pre.executeUpdate();
			}
			else{
				con = new MyConnection().connect();
				String sql = "insert into inwardmaterial (date,MaterialName,amount,quantity)values(?,?,?,?)";
				PreparedStatement  pre = con.prepareStatement(sql);
				pre.setString(1, in.getBookingDate());
				pre.setString(2, in.getMaterialName());
				pre.setString(3, in.getRateTone());
				pre.setString(4, in.getQuantity());
				pre.executeUpdate();
			}
			con.close();
		
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<MaterialDetails> checkMaterial(MaterialDetails met){
		ArrayList<MaterialDetails> list = new ArrayList<MaterialDetails>();
		try{
			con = new MyConnection().connect();
			String sql = "select * from inwardmaterial";
			PreparedStatement pred = con.prepareStatement(sql);
			ResultSet res = pred.executeQuery();
			while(res.next()){
				MaterialDetails mets = new MaterialDetails();
				mets.setMaterialId(res.getString(1));
				mets.setMaterialName(res.getString(3));
				mets.setBookingDate(res.getString(2));
				mets.setRateTone(res.getString(4));
				mets.setQuant(res.getString(5));
				list.add(mets);
				
			}
			con.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<OutwardDetails> outward(OutwardDetails  out){
		ArrayList<OutwardDetails> list = new ArrayList<OutwardDetails>();
		try{
			con = new MyConnection().connect();
			String sql = "select * from sales";
			PreparedStatement pre = con.prepareStatement(sql);
			ResultSet res = pre.executeQuery();
			while(res.next()){
				OutwardDetails outs = new OutwardDetails();
				outs.setMaderialId(res.getString(1));
				outs.setCustomerId(res.getString(2));
				outs.setMaterialName(res.getString(3));
				outs.setQuantity(res.getString(4));
				outs.setAmount(res.getString(5));
				outs.setTotal(res.getString(6));
				list.add(outs);
				
			}
			con.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return list;
		
	}
	
	public void addEmp(AddNewEmp emp){
		try{
			con = new MyConnection().connect();
			String sql = "insert into employee values(?,?,?,?,?,?,?,?)";
			PreparedStatement pred = con.prepareStatement(sql);
			pred.setString(1, emp.getDateofjoin());
			pred.setString(2, emp.getEmpid());
			pred.setString(3, emp.getEmpname());
			pred.setString(4, emp.getPhoneNumber());
			pred.setString(5, emp.getDesignation());
			pred.setString(6, emp.getAddress());
			pred.setString(7, emp.getEmail());
			pred.setString(8, emp.getSalary());
			pred.executeUpdate();
			con.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public ArrayList<EmployeeDetails> getEmployee(){
		ArrayList<EmployeeDetails> list = new ArrayList<EmployeeDetails>();
		try{
			con = new MyConnection().connect();
			String sql ="select * from employee";
			PreparedStatement pred = con.prepareStatement(sql);
			ResultSet res = pred.executeQuery();
			while(res.next()){
				EmployeeDetails emp = new EmployeeDetails();
				emp.setDateofjoin(res.getString(1));
				emp.setEmpid(res.getString(2));
				emp.setEmpname(res.getString(3));
				emp.setDesignation(res.getString(5));
				emp.setPhone(res.getString(4));
				emp.setAddress(res.getString(6));
				emp.setEmail(res.getString(7));
				emp.setSalary(res.getString(8));
				list.add(emp);
				
			}
			con.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return list;
		
	}
	public void deleteEmp(String empid){
		try{
			con = new MyConnection().connect();
			String sql = "delete from employee where empid=?";
			PreparedStatement pred = con.prepareStatement(sql);
			pred.setString(1, empid);
			pred.executeUpdate();
			con.close();
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public ArrayList<UpdateEmpDetails> empgetDet(String emp){
		ArrayList<UpdateEmpDetails> list = new ArrayList<UpdateEmpDetails>();
		try{
			con = new MyConnection().connect();
			String sql = "select * from employee where empid=?";
			PreparedStatement pred = con.prepareStatement(sql);
			pred.setString(1, emp);
			ResultSet res = pred.executeQuery();
			res.next();
			System.out.println(res.getString(3));
			UpdateEmpDetails emp1 = new UpdateEmpDetails();
			emp1.setDateofjoin(res.getString(1));
			emp1.setEmpid(res.getString(2));
			emp1.setEmpname(res.getString(3));
			emp1.setDesignation(res.getString(5));
			emp1.setPhone(res.getString(4));
			emp1.setAddress(res.getString(6));
			emp1.setEmail(res.getString(7));
			emp1.setSalary(res.getString(8));
			list.add(emp1);
			con.close();
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public void updateEmp(UppdateEmpDets up){
		try{
			con = new MyConnection().connect();
			System.out.println(up.getEmpid());
			String sql = "update employee set empname=?,phone=?,designation=?,address=?,email=?,salary=? where empid=?";
			PreparedStatement pred = con.prepareStatement(sql);
			pred.setString(1, up.getEmpname());
			pred.setString(2, up.getPhoneNumber());
			pred.setString(3, up.getDesignation());
			pred.setString(4, up.getAddress());
			pred.setString(5, up.getEmail());
			pred.setString(6, up.getSalary());
			pred.setString(7, up.getEmpid());
			pred.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	public ArrayList<DispMaterial> dispmat(){
		ArrayList<DispMaterial> list= new ArrayList<DispMaterial>();
		try{
			con = new MyConnection().connect();
			String sql="select * from inwardmaterial";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				DispMaterial dis=new DispMaterial();
				dis.setMatname(rs.getString(3));
				dis.setAmount(rs.getString(4));
				list.add(dis);
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<GetAmount> getamnt(GetAmount gmnt){
		ArrayList<GetAmount>list= new ArrayList<GetAmount>();
		try{
			con = new MyConnection().connect();
			String sql="select * from inwardmaterial where MaterialName=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, gmnt.getId());
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				GetAmount amnt= new GetAmount();
				amnt.setAmnt(rs.getString(4));
				list.add(amnt);
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public void deleteitem(String id){
		try{
			con = new MyConnection().connect();
			String sql="delete  from inwardmaterial where MaterialId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
