package com.digital.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import com.digital.dao.TypeDAO;
import com.digital.dao.impl.TypeDAOImpl;
import com.digital.entity.Type;
import com.opensymphony.xwork2.ActionSupport;


@SuppressWarnings("serial")
public class ProductInfoAction extends ActionSupport implements RequestAware{
	
	Map<String,Object> request;
	public String list(){
		TypeDAO typeDAO=new TypeDAOImpl();
		List<Type> typeList=typeDAO.getAll();
		if(typeList.size()>0){
			request.put("typeList", typeList);
		}
		return "index";
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request=request;
	}
}
