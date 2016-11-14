/*package cn.edu.nuc.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.nuc.ssm.entity.MbSysuser;
import cn.edu.nuc.ssm.service.interfaces.MbUserService;



@Controller
public class MbUserControllerAjax {
	
	@Autowired
	private MbUserService mbUserService;
	
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login2(){
		
		return "login";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(@Valid MbSysuser mbSysuser, Errors error, HttpSession session,Model model){
		if(error.hasErrors()){
			return "/login";
		}
		MbSysuser us = mbUserService.login(mbSysuser.getUsername(), mbSysuser.getUserpwd());
		if(us==null){
			model.addAttribute("message", "用户名或密码不正确");
			return "forward:/login.jsp";
		} else{
			session.setAttribute("us", us);
			return "forward:/function/initPage";
		}
	}
	
	
	//退出登录
	@RequestMapping(value="/quit",method=RequestMethod.GET)
	public String quit(HttpServletRequest request){
		HttpSession session = request.getSession(false);//防止创建Session  
        if(session == null){  
            return "redirect:/login";  
        }  
        session.removeAttribute("us");  
		return "redirect:/login";
	}
	
	//跳转到增加用户界面
	@RequestMapping(value="/toAddUser",method=RequestMethod.GET)
	public String toAddUser(){
		return "/user/addUser";
	}
	
	//添加用户
	@ResponseBody
	@RequestMapping(value="/addUser",method=RequestMethod.POST)
	public int addUser(MbSysuser mbSysuser){
		return mbUserService.addUser(mbSysuser);
	}

	//查询所用用户
	@ResponseBody
	@RequestMapping(value="/selectAllUser",method=RequestMethod.GET)
	public List<MbSysuser> selectAllUser(){
		return mbUserService.selectAllUser();
	}
	
	
	@ResponseBody
	@RequestMapping(value="/selectAllUserByName",method=RequestMethod.POST)
	public List<MbSysuser> selectAllUserByName(MbSysuser mbSysuser){
		
		List<MbSysuser> userlist = mbUserService.selectAllUser(mbSysuser);
		
		return userlist;
	}
	
	@RequestMapping(value="/selectAllUser",method=RequestMethod.GET)
	public String selectAllUser(Model model){
		List<MbSysuser> userlist = mbUserService.selectAllUser(null);
		model.addAttribute("userlist", userlist);
		return "/user/userlist";
	}
	
	//删除用户
	@ResponseBody
	@RequestMapping(value="/deleteUser",method=RequestMethod.POST)
	public int deleteUser(int userid){
		return mbUserService.deleteUser(userid);
	}
	
	
}
*/