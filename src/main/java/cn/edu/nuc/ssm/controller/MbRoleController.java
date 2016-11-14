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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.nuc.ssm.dto.PageInfo;
import cn.edu.nuc.ssm.entity.MbSysfunction;
import cn.edu.nuc.ssm.entity.MbSysrole;
import cn.edu.nuc.ssm.entity.MbSysuser;
import cn.edu.nuc.ssm.service.interfaces.MbFunctionService;
import cn.edu.nuc.ssm.service.interfaces.MbRoleService;
import cn.edu.nuc.ssm.service.interfaces.MbUserService;



@Controller
@RequestMapping("/role")
public class MbRoleController {
	
	@Autowired
	private MbRoleService mbRoleService;
	
	//跳转到增加角色界面
	@RequestMapping(value="/toAddRole",method=RequestMethod.GET)
	public String toAddRole(){
		
		return "/role/addRole";
	}
	
	//添加角色
	@ResponseBody
	@RequestMapping(value="/addRole",method=RequestMethod.POST)
	public int addRole(@Valid MbSysrole mbSysrole,Errors error){
		if(error.hasErrors()){
			return -1;
		}
		return mbRoleService.addRole(mbSysrole);
	}
	
	//根据输入内容查询角色
	@ResponseBody
	@RequestMapping(value="/selectAllRoleByName",method=RequestMethod.POST)
	public PageInfo selectAllRoleByName(String name,@RequestParam(name="current",defaultValue="1") int current){
		PageInfo pi = mbRoleService.selectAllRole(name, current);
		
		return pi;
	}
	
	//查询所有角色
	@RequestMapping(value="/selectAllRole",method=RequestMethod.GET)
	public String selectAllRole(Model model,@RequestParam(name="current",defaultValue="1") int current){
		PageInfo pi = mbRoleService.selectAllRole(null, current);
		model.addAttribute("pi", pi);
		return "/role/rolelist";
	}
	
	//跳转到修改角色界面
	@RequestMapping(value="/toEditRole",method=RequestMethod.GET)
	public String toEditRole(int roleid,Model model){
		MbSysrole role = mbRoleService.selectRoleByid(roleid);
		model.addAttribute("role", role);
		return "/role/editRole";
	}

	//编辑角色
	@ResponseBody
	@RequestMapping(value="/editRole",method=RequestMethod.POST)
	public int editRole(MbSysrole mbSysrole){
		return mbRoleService.editRole(mbSysrole);
	}
	
	//跳转到编辑角色权限
	@RequestMapping(value="/toRoleRight",method=RequestMethod.GET)
	public String toRoleRight(int roleid,Model model){
		MbSysrole role = mbRoleService.selectRoleByid(roleid);
		List<MbSysfunction> funlist = mbRoleService.initroleright(roleid);
		model.addAttribute("role", role);
		model.addAttribute("funlist", funlist);
		return "/role/right";
	}
	
	//保存角色权限
	@ResponseBody
	@RequestMapping(value="/saveRoleRight",method=RequestMethod.POST)
	public int saveRoleRight(String roleid, String[] funids){
		return mbRoleService.saveright(roleid, funids);
	}
	
}
