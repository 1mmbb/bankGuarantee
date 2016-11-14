package cn.edu.nuc.ssm.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.nuc.ssm.dto.PageInfo;
import cn.edu.nuc.ssm.entity.MbSysrole;
import cn.edu.nuc.ssm.entity.MbSysuser;
import cn.edu.nuc.ssm.service.interfaces.MbUserService;



@Controller
public class MbUserController {
	
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
			return "forward:/function/initPage/"+us.getRoleid();
		}
	}
	
	
	//退出登录
	@RequestMapping(value="/quit",method=RequestMethod.GET)
	public String quit(HttpServletRequest request){
		HttpSession session = request.getSession(false);//防止创建Session  
        if(session == null){  
            return "redirect:/login.jsp";  
        }  
        session.removeAttribute("us");  
		return "redirect:/login.jsp";
	}
	
	//跳转到增加用户界面
	@RequestMapping(value="/toAddUser",method=RequestMethod.GET)
	public String toAddUser(Model model){
		List<MbSysrole> roleList = mbUserService.selectAllRole();
		model.addAttribute("roleList", roleList);
		return "/user/addUser";
	}
	
	//添加用户
	@ResponseBody
	@RequestMapping(value="/addUser",method=RequestMethod.POST)
	public int addUser(@Valid MbSysuser mbSysuser,Errors error){
		if(error.hasErrors()){
			return -1;
		}
		return mbUserService.addUser(mbSysuser);
	}

	//根据输入内容查询用户
	@ResponseBody
	@RequestMapping(value="/selectAllUserByName",method=RequestMethod.POST)
	public PageInfo selectAllUserByName(String name,@RequestParam(name="current",defaultValue="1") int current){
		System.out.println("++++++name="+name+"======current="+current);
		PageInfo pi = mbUserService.selectAllUser(name, current);
		
		return pi;
	}
	
	//查询所有用户
	@RequestMapping(value="/selectAllUser",method=RequestMethod.GET)
	public String selectAllUser(Model model,@RequestParam(name="current",defaultValue="1") int current){
		PageInfo pi = mbUserService.selectAllUser(null, current);
		model.addAttribute("pi", pi);
		return "/user/userlist";
	}
	
	//根据id查询用户,跳转到编辑用户界面
	@RequestMapping(value="/selectUserByid",method=RequestMethod.GET)
	public String selectUserByid(int userid,Model model){
		List<MbSysrole> roleList = mbUserService.selectAllRole();
		MbSysuser user = mbUserService.selectUserByid(userid);
		model.addAttribute("roleList", roleList);
		model.addAttribute("user", user);
		return "/user/editUser";
	}
	
	//编辑用户
	@ResponseBody
	@RequestMapping(value="/editUser",method=RequestMethod.POST)
	public int editUser(MbSysuser mbSysuser){
		return mbUserService.editUser(mbSysuser);
		
	}
	
	//删除用户
	@ResponseBody
	@RequestMapping(value="/deleteUser",method=RequestMethod.POST)
	public int deleteUser(int userid){
		return mbUserService.deleteUser(userid);
	}
	
	//密码修改
	@RequestMapping(value="/toeditpwd",method=RequestMethod.GET)
	public String toeditpwd(){
		return "/user/editpwd";
	}
	
	@RequestMapping(value="/editpwd",method=RequestMethod.POST)
	public String editpwd(MbSysuser mbSysuser,Model model){
		mbUserService.editUser(mbSysuser);
		return "redirect:/editpwd2";
	}
	
	@RequestMapping(value="/editpwd2",method=RequestMethod.GET)
	public String editpwd2(Model model){
		model.addAttribute("mm", "修改成功");
		return "/user/editpwd";
	}
}
