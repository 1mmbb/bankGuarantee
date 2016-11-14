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
import cn.edu.nuc.ssm.entity.MbTransDetail;
import cn.edu.nuc.ssm.entity.MbTransType;
import cn.edu.nuc.ssm.service.interfaces.MbFunctionService;
import cn.edu.nuc.ssm.service.interfaces.MbTransService;
import cn.edu.nuc.ssm.service.interfaces.MbUserService;



@Controller
@RequestMapping("/trans")
public class MbTransController {
	
	@Autowired
	private  MbTransService mbTransService;
	
	//查询出所有事务明细
	@RequestMapping(value="/toTransSetup",method=RequestMethod.GET)
	public String toServiceSetup(Model model,@RequestParam(name="current",defaultValue="1") int current){
		PageInfo pi = mbTransService.selectAllTD(null, current);
		model.addAttribute("pi", pi);
		return "/trans/transSetup";
	}
	
	//根据输入内容查询事务明细
	@ResponseBody
	@RequestMapping(value="/selectAllTDByTDName",method=RequestMethod.POST)
	public PageInfo selectAllTDByTDName(String name,@RequestParam(name="current",defaultValue="1") int current){
		PageInfo pi = mbTransService.selectAllTD(name, current);
		return pi;
	}
	
	//跳转到添加事务明细
	@RequestMapping(value="/toAddTrans",method=RequestMethod.GET)
	public String toAddTrans(Model model){
		List<MbTransType> ttlist = mbTransService.selectAllTransType();
		model.addAttribute("ttlist", ttlist);
		return "/trans/addTrans";
	}
	
	//添加事务明细
	@RequestMapping(value="/addTrans",method=RequestMethod.POST)
	public String addTrans(MbTransDetail mbTransDetail){
		mbTransService.addTrans(mbTransDetail);
		return "redirect:/trans/toTransSetup";
	}
	
	//跳转到编辑事务明细
	@RequestMapping(value="/toEditTrans",method=RequestMethod.GET)
	public String toEditTrans(int tdid,Model model){
		MbTransDetail  td = mbTransService.selectByTDid(tdid);
		List<MbTransType> ttlist = mbTransService.selectAllTransType();
		model.addAttribute("ttlist", ttlist);
		model.addAttribute("td", td);
		return "/trans/editTrans";
	}
	
	//删除事务明细
	@ResponseBody
	@RequestMapping(value="/delTrans",method=RequestMethod.POST)
	public int delTrans(int tdid){
		return mbTransService.delTrans(tdid);
	}
	
	@RequestMapping(value="/toTransType",method=RequestMethod.GET)
	public String toTransType(Model model){
		List<MbTransType> ttlist = mbTransService.selectAllTransType();
		model.addAttribute("ttlist", ttlist);
		return "/trans/transType";
	}
	
	//添加事物种类
	@ResponseBody
	@RequestMapping(value="/addTransType",method=RequestMethod.POST)
	public List<MbTransType> addTransType(MbTransType mbTransType){
		System.out.println(mbTransType.getTtname());
		mbTransService.addTransType(mbTransType);
		return mbTransService.selectAllTransType();
	}
	
	//删除事务种类
	@ResponseBody
	@RequestMapping(value="/delTransType",method=RequestMethod.POST)
	public int delTransType(int ttid){
		return mbTransService.delTransType(ttid);
	}
	
	
}
