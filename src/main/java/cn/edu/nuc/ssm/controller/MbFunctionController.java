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
import cn.edu.nuc.ssm.service.interfaces.MbUserService;



@Controller
@RequestMapping("/function")
public class MbFunctionController {
	
	@Autowired
	private MbFunctionService mbFunctionService;
	
	
	@RequestMapping(value="/initPage/{roleid}",method=RequestMethod.POST)
	public String login2(@PathVariable("roleid") int roleid, Model model){
		List<MbSysfunction> funlist = null;
		if(roleid==-1){
			funlist = mbFunctionService.selectAllNormalFunction();
		} else{
			funlist = mbFunctionService.selectRoleFun(roleid);
		}
		model.addAttribute("funlist", funlist);
		return "/index3";
	}
	
	//跳转到增加功能界面
	@RequestMapping(value="/toAddFunction",method=RequestMethod.GET)
	public String toAddFunction(int funpid,String funpname,Model model){
		System.out.println(funpid+" ==== "+funpname);
		model.addAttribute("pid", funpid);
		model.addAttribute("pname", funpname);
		return "/function/addFunction";
	}
	
	//添加用户
	@ResponseBody
	@RequestMapping(value="/addFunction",method=RequestMethod.POST)
	public int addFunction(@Valid MbSysfunction mbSysfunction,Errors error){
		if(error.hasErrors()){
			return -1;
		}
		return mbFunctionService.addFunction(mbSysfunction);
	}
	
	//根据输入内容查询功能
	@ResponseBody
	@RequestMapping(value="/selectAllFunctionByName",method=RequestMethod.POST)
	public PageInfo selectAllUserByName(String name,@RequestParam(name="current",defaultValue="1") int current){
		PageInfo pi = mbFunctionService.selectAllFunction(name, current);
		
		return pi;
	}
	
	//查询所有功能
	@RequestMapping(value="/selectAllFunction",method=RequestMethod.GET)
	public String selectAllUser(Model model,@RequestParam(name="current",defaultValue="1") int current){
		PageInfo pi = mbFunctionService.selectAllFunction(null, current);
		model.addAttribute("pi", pi);
		return "/function/functionlist";
	}
	
	//跳转到修改功能界面
	@RequestMapping(value="/toEditFunction",method=RequestMethod.GET)
	public String toEditFunction(int funid,Model model){
		MbSysfunction fun = mbFunctionService.selectFunctionByid(funid);
		model.addAttribute("fun", fun);
		return "/function/editFunction";
	}

	//编辑用户
	@ResponseBody
	@RequestMapping(value="/editFunction",method=RequestMethod.POST)
	public int editUser(MbSysfunction mbSysfunction){
		return mbFunctionService.editFunction(mbSysfunction);
		
	}
}
