package cn.edu.nuc.ssm.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.nuc.ssm.dto.Statistics;
import cn.edu.nuc.ssm.entity.MbDemand;
import cn.edu.nuc.ssm.entity.MbSysuser;
import cn.edu.nuc.ssm.entity.MbTransDetail;
import cn.edu.nuc.ssm.entity.MbTransType;
import cn.edu.nuc.ssm.entity.MbUserDemand;
import cn.edu.nuc.ssm.service.interfaces.MbDemandService;
import cn.edu.nuc.ssm.view.ViewExcel;



@Controller
@RequestMapping("/demand")
public class MbDemandController {
	
	@Autowired
	private  MbDemandService mbDemandService;
	
	//跳转到新需求申报
	@RequestMapping(value="/toAddDemand",method=RequestMethod.GET)
	public String toAddDemand(Model model){
		List<MbTransType> ttlist = mbDemandService.selectAllTransType();
		model.addAttribute("ttlist", ttlist);
		return "/demand/demandReport";
	}
	
	//根据事务种类 选择出 事务明细
	@ResponseBody
	@RequestMapping(value="/selectTdName",method=RequestMethod.POST)
	public List<MbTransDetail> selectTdName(int ttid){
		List<MbTransDetail> tdnames = mbDemandService.selectTDname(ttid);
		return tdnames;
	}
	
	//根据事务明细id查出 事务明细
	@ResponseBody
	@RequestMapping(value="/selectTdetails",method=RequestMethod.POST)
	public MbTransDetail selectTdetails(int tdid){
		return mbDemandService.selectTdetails(tdid);
	}
	
	//添加新需求
	@RequestMapping(value="/AddDemand",method=RequestMethod.POST)
	public String addDemand(MbDemand mbDemand){
		mbDemandService.addDemand(mbDemand);
		return "redirect:/demand/toDemandQuery";
	}
	
	//跳到事务处理界面
	@RequestMapping(value="/toDemandQuery",method=RequestMethod.GET)
	public String toDemandQuery(Model model){
		List<MbDemand> notdlist = mbDemandService.selectDemandNotOver();
		List<MbDemand> dlist = mbDemandService.selectDemandOver();
		model.addAttribute("notdlist", notdlist);
		model.addAttribute("dlist", dlist);
		return "/demand/demandQuery";
	}
	
	//ajax跳到事务处理界面
	@ResponseBody
	@RequestMapping(value="/toDemandQuery2",method=RequestMethod.POST)
	public List<MbDemand> toDemandQuery2(){
		 return mbDemandService.selectDemandNotOver();
	}
	
	//跳转到查看 处理需求页面
	@RequestMapping(value="/toViewDemand",method=RequestMethod.GET)
	public String toViewDemand(int deid,int tdid, Model model,HttpSession session){
		MbSysuser sy = (MbSysuser) session.getAttribute("us");
		MbTransDetail td = mbDemandService.selectByTDid(tdid);
		MbDemand de = mbDemandService.selectDemandByid(deid);
		model.addAttribute("sy", sy);
		model.addAttribute("td", td);
		model.addAttribute("de", de);
		return "/demand/viewDemand";
	}
	
	//添加用户处理需求 催办
	@ResponseBody
	@RequestMapping(value="/addUserDemand",method=RequestMethod.POST)
	public int addUserDemand(MbUserDemand mbUserDemand){
		int count = mbDemandService.addUserDemand(mbUserDemand);
		return count;
	}
	
	//添加用户处理需求 审核
	@ResponseBody
	@RequestMapping(value="/addshenhe",method=RequestMethod.POST)
	public int addshenhe(MbUserDemand mbUserDemand){
		int count = mbDemandService.addshenhe(mbUserDemand);
		return count;
	}
	
	//添加用户处理需求 处理
	@ResponseBody
	@RequestMapping(value="/addchuli",method=RequestMethod.POST)
	public int addchuli(MbUserDemand mbUserDemand){
		System.out.println("=="+mbUserDemand.getContent());
		int count = mbDemandService.addchuli(mbUserDemand);
		return count;
	}
	
	//添加用户处理需求 办结
	@ResponseBody
	@RequestMapping(value="/addbanjie",method=RequestMethod.POST)
	public int addbanjie(MbUserDemand mbUserDemand){
		int count = mbDemandService.addbanjie(mbUserDemand);
		return count;
	}
	
	//查询用户处理需求
	@ResponseBody
	@RequestMapping(value="/selectUserDemand",method=RequestMethod.GET)
	public List<MbUserDemand> selectUserDemand(int deid){
		return mbDemandService.selectUserDemand(deid);
	}
	
	//回收用户需求
	@RequestMapping(value="/huishou",method=RequestMethod.GET)
	public String huishou(int deid){
		mbDemandService.huishou(deid);
		return "redirect:/demand/toDemandQuery";
	}
	
	//导出excel
	@RequestMapping(value="/excel",method=RequestMethod.POST)
	public ModelAndView excel(Statistics statistics,Map<String, Object> map){
		ViewExcel viewExcel = new ViewExcel();
		List<MbDemand> delist = mbDemandService.selectAllDemand(statistics);
		map.put("delist", delist);
		map.put("fileName", "需求详细列表.xls");
		
		return new ModelAndView(viewExcel, map);
	}
	
	//跳转到事务统计 页面
	@RequestMapping(value="/statistics",method=RequestMethod.GET)
	public String statistics(){
		
		return "/demand/demandStatistics";
	}
}
