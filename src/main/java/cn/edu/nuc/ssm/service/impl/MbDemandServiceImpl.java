package cn.edu.nuc.ssm.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.nuc.ssm.dao.MbDemandMapper;
import cn.edu.nuc.ssm.dao.MbSysroleMapper;
import cn.edu.nuc.ssm.dao.MbSysuserMapper;
import cn.edu.nuc.ssm.dao.MbTransDetailMapper;
import cn.edu.nuc.ssm.dao.MbTransTypeMapper;
import cn.edu.nuc.ssm.dao.MbUserDemandMapper;
import cn.edu.nuc.ssm.dto.PageInfo;
import cn.edu.nuc.ssm.dto.Statistics;
import cn.edu.nuc.ssm.entity.MbDemand;
import cn.edu.nuc.ssm.entity.MbSysrole;
import cn.edu.nuc.ssm.entity.MbSysuser;
import cn.edu.nuc.ssm.entity.MbTransDetail;
import cn.edu.nuc.ssm.entity.MbTransType;
import cn.edu.nuc.ssm.entity.MbUserDemand;
import cn.edu.nuc.ssm.service.interfaces.MbDemandService;
import cn.edu.nuc.ssm.service.interfaces.MbTransService;
import cn.edu.nuc.ssm.service.interfaces.MbUserService;



@Service
public class MbDemandServiceImpl implements MbDemandService {

	@Autowired
	private MbTransTypeMapper mbTransTypeMapper;
	@Autowired
	private MbTransDetailMapper mbTransDetailMapper;
	@Autowired
	private MbDemandMapper mbDemandMapper;
	@Autowired
	private MbUserDemandMapper mbUserDemandMapper;
	
	@Override
	public List<MbTransType> selectAllTransType() {
		List<MbTransType> ttlist = mbTransTypeMapper.selectAllTransType();
		return ttlist;
	}

	@Override
	public List<MbTransDetail> selectTDname(int ttid) {
		// TODO Auto-generated method stub
		return mbTransDetailMapper.selectTdNameByttid(ttid);
	}

	@Override
	public MbTransDetail selectTdetails(int tdid) {
		// TODO Auto-generated method stub
		return mbTransDetailMapper.selectByPrimaryKey(tdid);
	}

	@Override
	public int addDemand(MbDemand mbDemand) {
		mbDemand.setIftrial(0);
		mbDemand.setDestate(0);//设置状态未受理
		mbDemand.setReminders(0);//设置催办次数
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		java.util.Date date=new java.util.Date();  
		String str=sdf.format(date); 
		mbDemand.setReportTime(str);//设置上报时间
				
		try {
			long m = sdf.parse(str).getTime() + (7*24*60*60*1000);
			String overTime = sdf.format(new Date(m));
			mbDemand.setOverTime(overTime);//设置超时时间，一周以后超时
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return mbDemandMapper.insertSelective(mbDemand);
	}

	@Override
	public List<MbDemand> selectDemandNotOver() {
		// TODO Auto-generated method stub
		return mbDemandMapper.selectDemandNotOver();
	}

	@Override
	public List<MbDemand> selectDemandOver() {
		// TODO Auto-generated method stub
		return mbDemandMapper.selectDemandOver();
	}

	@Override
	public MbDemand selectDemandByid(int deid) {
		// TODO Auto-generated method stub
		return mbDemandMapper.selectDemandByid(deid);
	}

	@Override
	public MbTransDetail selectByTDid(int tdid) {
		// TODO Auto-generated method stub
		return mbTransDetailMapper.selectByPrimaryKey(tdid);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public int addUserDemand(MbUserDemand mbUserDemand) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		java.util.Date date=new java.util.Date();  
		String str=sdf.format(date); 
		mbUserDemand.setDealtime(str);
		
		String s = "催办：";
		String s2 = s+mbUserDemand.getContent();
		mbUserDemand.setContent(s2);
		
		//催办次数加1
		int deid = mbUserDemand.getDeid();
		MbDemand mbDemand = mbDemandMapper.selectByPrimaryKey(deid);
		mbDemand.setReminders(mbDemand.getReminders()+1);
		mbDemandMapper.updateByPrimaryKey(mbDemand);
		
		return mbUserDemandMapper.insertSelective(mbUserDemand);
	}

	@Override
	public List<MbUserDemand> selectUserDemand(int deid) {
		// TODO Auto-generated method stub
		return mbUserDemandMapper.selectUserDemand(deid);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public int addshenhe(MbUserDemand mbUserDemand) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		java.util.Date date=new java.util.Date();  
		String str=sdf.format(date); 
		mbUserDemand.setDealtime(str);
		
		String s = "审核：";
		String s2 = s+mbUserDemand.getContent();
		mbUserDemand.setContent(s2);
		
		int deid = mbUserDemand.getDeid();
		MbDemand mbDemand = mbDemandMapper.selectByPrimaryKey(deid);//获取处理的需求
		mbDemand.setDestate(1);
		mbDemandMapper.updateByPrimaryKey(mbDemand);
		
		return mbUserDemandMapper.insertSelective(mbUserDemand);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public int addchuli(MbUserDemand mbUserDemand) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		java.util.Date date=new java.util.Date();  
		String str=sdf.format(date); 
		mbUserDemand.setDealtime(str);
		
		String s = "处理：";
		String s2 = s+mbUserDemand.getContent();
		mbUserDemand.setContent(s2);
		
		int deid = mbUserDemand.getDeid();
		MbDemand mbDemand = mbDemandMapper.selectByPrimaryKey(deid);//获取处理的需求
		mbDemand.setDestate(2);
		mbDemandMapper.updateByPrimaryKey(mbDemand);
		
		return mbUserDemandMapper.insertSelective(mbUserDemand);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public int addbanjie(MbUserDemand mbUserDemand) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		java.util.Date date=new java.util.Date();  
		String str=sdf.format(date); 
		mbUserDemand.setDealtime(str);
		
		String s = "办结：";
		String s2 = s+mbUserDemand.getContent();
		mbUserDemand.setContent(s2);
		
		int deid = mbUserDemand.getDeid();
		MbDemand mbDemand = mbDemandMapper.selectByPrimaryKey(deid);//获取处理的需求
		mbDemand.setDestate(3);
		mbDemandMapper.updateByPrimaryKey(mbDemand);
		
		return mbUserDemandMapper.insertSelective(mbUserDemand);
	}

	@Override
	public int huishou(int deid) {
		// TODO Auto-generated method stub
		return mbDemandMapper.deleteByPrimaryKey(deid);
	}

	@Override
	public List<MbDemand> selectAllDemand(Statistics statistics) {
		// TODO Auto-generated method stub
		String firsttime = statistics.getFirsttime()+" 00:00:00";
		String lasttime = statistics.getLasttime()+" 23:59:59";
		statistics.setFirsttime(firsttime);
		statistics.setLasttime(lasttime);
		return mbDemandMapper.selectAllDemand(statistics);
	}



}
