package cn.edu.nuc.ssm.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nuc.ssm.dao.MbNoticeMapper;
import cn.edu.nuc.ssm.dao.MbSysuserMapper;
import cn.edu.nuc.ssm.entity.MbNotice;
import cn.edu.nuc.ssm.entity.MbSysuser;
import cn.edu.nuc.ssm.service.interfaces.MbNoticeService;





@Service
public class MbNoticeServiceImpl implements MbNoticeService {

	@Autowired
	private MbNoticeMapper mbNoticeMapper;
	@Autowired
	private MbSysuserMapper mbSysuserMapper;

	@Override
	public List<MbNotice> selectAllNotice() {
		// TODO Auto-generated method stub
		return mbNoticeMapper.selectAllNotice();
	}

	@Override
	public int addNotice(MbNotice mbNotice,int userid) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		java.util.Date date=new java.util.Date();  
		String str=sdf.format(date); 
		mbNotice.setNoticetime(str);
		
		MbSysuser u = mbSysuserMapper.selectByPrimaryKey(userid);
		mbNotice.setRoleid(u.getRoleid());
		
		return mbNoticeMapper.insertSelective(mbNotice);
	
	}

	@Override
	public int delNotice(int noticeid) {
		// TODO Auto-generated method stub
		return mbNoticeMapper.deleteByPrimaryKey(noticeid);
	}
	
}
