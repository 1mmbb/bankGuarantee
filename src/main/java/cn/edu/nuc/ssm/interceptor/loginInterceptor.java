package cn.edu.nuc.ssm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.nuc.ssm.entity.MbSysuser;


public class loginInterceptor implements HandlerInterceptor {

	/**
	 * 1、权限拦截
	 * 
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		
		HttpSession session = request.getSession(false);//防止创建Session  
        if(session == null){  
        	response.sendRedirect("/login"); 
        	return false;
        } else {
        	
        	MbSysuser us = (MbSysuser) session.getAttribute("us");
    		if(us!=null){
    			return true;
    		}else{
    			response.sendRedirect("/login"); 
            	return false;
    		}
        }
		
		/*if( request.getRequestURI().startsWith("/interceptor") ){
			response.sendRedirect("/aa.html");
			return false;
		} else{
			return true;
		}*/
		
	}
	

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		//System.out.println("My1HandlerInterceptor-->postHandle");

	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		//System.out.println("My1HandlerInterceptor-->afterCompletion");

	}

}
