package cn.edu.nuc.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.nuc.ssm.entity.MbNotice;
import cn.edu.nuc.ssm.entity.MbSysuser;
import cn.edu.nuc.ssm.service.interfaces.MbNoticeService;

@Controller
@RequestMapping("/notice")
public class MbNoticeController {
	
	@Autowired
	private MbNoticeService mbNoticeService;
	
	//跳转到公告界面
	@RequestMapping(value="/toNotice",method=RequestMethod.GET)
	public String toNotice(Model model){
		List<MbNotice> notices = mbNoticeService.selectAllNotice();
		model.addAttribute("notices", notices);
		return "/notice";
	}
	
	//跳转到增加新公告
	@RequestMapping(value="/toaddNotice",method=RequestMethod.GET)
	public String toaddNotice(Model model){
		
		List<MbNotice> notices = mbNoticeService.selectAllNotice();
		model.addAttribute("notices", notices);
		
		return "/addNotice";
	}
	
	//增加新公告
	@RequestMapping(value="/addNotice",method=RequestMethod.POST)
	public String addNotice(MbNotice mbNotice,HttpSession session){
		MbSysuser user = (MbSysuser) session.getAttribute("us");
		
		mbNoticeService.addNotice(mbNotice, user.getUserid());
		return "redirect:/notice/toNotice";
	}
	
	//增加新公告
	@ResponseBody
	@RequestMapping(value="/delNotice",method=RequestMethod.POST)
	public List<MbNotice> delNotice(int noticeid){
		int count = mbNoticeService.delNotice(noticeid);
		List<MbNotice> notices = mbNoticeService.selectAllNotice();
		return notices;
	}
}
