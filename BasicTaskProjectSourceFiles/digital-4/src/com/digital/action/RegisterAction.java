package com.digital.action;
import com.digital.dao.UserDAO;
import com.digital.dao.impl.UserDAOImpl;
import com.digital.entity.User;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class RegisterAction extends ActionSupport{
	private User user;
	private String repassword;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	
	public String register(){
		
		UserDAO userDAO=new UserDAOImpl();
		int result=userDAO.addUser(user);
		String back;
		if(result!=0){
			back="success";
		}else{
			back="input";
		}
		return back;
	}
	
//	public void validateReg(){
//		if(user.getUserName().length()==0){
//			addFieldError("user.userName.null",getText("userName.null"));
//		}
//		if(user.getPassword().length()==0){
//			addFieldError("user.password", getText("password.null"));
//		}
//		if(!user.getPassword().equals(this.getRepassword())){
//			addFieldError("repassword",getText("repassword.same"));
//			}
//	}
    
	/*public void validate(){
		if(user.getUserName().length()==0){
			addFieldError("userName","用户名不能为空!");
		}
		if(user.getPassword().length()==0){
			addFieldError("password", "密码不能为空!");
		}
		if(!user.getPassword().equals(this.getRepassword())){
			addFieldError("repassword","确认密码和密码不一致!");
		}
		super.validate();
	}*/

}
