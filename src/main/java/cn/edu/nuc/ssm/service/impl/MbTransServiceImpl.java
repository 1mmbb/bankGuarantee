package cn.edu.nuc.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nuc.ssm.dao.MbSysroleMapper;
import cn.edu.nuc.ssm.dao.MbSysuserMapper;
import cn.edu.nuc.ssm.dao.MbTransDetailMapper;
import cn.edu.nuc.ssm.dao.MbTransTypeMapper;
import cn.edu.nuc.ssm.dto.PageInfo;
import cn.edu.nuc.ssm.entity.MbSysrole;
import cn.edu.nuc.ssm.entity.MbSysuser;
import cn.edu.nuc.ssm.entity.MbTransDetail;
import cn.edu.nuc.ssm.entity.MbTransType;
import cn.edu.nuc.ssm.service.interfaces.MbTransService;
import cn.edu.nuc.ssm.service.interfaces.MbUserService;



@Service
public class MbTransServiceImpl implements MbTransService {

	@Autowired
	private MbTransTypeMapper mbTransTypeMapper;
	@Autowired
	private MbTransDetailMapper mbTransDetailMapper;
	
	@Override
	public List<MbTransType> selectAllTransType() {
		List<MbTransType> ttlist = mbTransTypeMapper.selectAllTransType();
		return ttlist;
	}

	@Override
	public int addTransType(MbTransType mbTransType) {
		return mbTransTypeMapper.insertSelective(mbTransType);
	}

	@Override
	public int delTransType(Integer ttid) {
		return mbTransTypeMapper.deleteByPrimaryKey(ttid);
	}

	@Override
	public PageInfo selectAllTD(String ttname, int current) {
		PageInfo pi = new PageInfo(current);
		
		List<MbTransDetail> tdlist = null;
		List<MbTransDetail> tdlist2 = null;
		if(ttname != null && !ttname.equals("")){
			String name = "%"+ttname+"%";
			MbTransDetail td = new MbTransDetail();
			td.setTdname(name);
			tdlist = mbTransDetailMapper.selectAllTD(td);
			tdlist2 = mbTransDetailMapper.selectAllTDPage(name, pi.getStart(), pi.getOffset());
		}else{
			tdlist = mbTransDetailMapper.selectAllTD(null);
			tdlist2 = mbTransDetailMapper.selectAllTDPage(null, pi.getStart(), pi.getOffset());
		}
		pi.setCount( tdlist.size() );
		pi.setList(tdlist2);
		
		return pi;
	}

	@Override
	public int addTrans(MbTransDetail mbTransDetail) {
		return mbTransDetailMapper.insertSelective(mbTransDetail);
	}

	@Override
	public MbTransDetail selectByTDid(int tdid) {
		// TODO Auto-generated method stub
		return mbTransDetailMapper.selectByPrimaryKey(tdid);
	}

	@Override
	public int delTrans(Integer tdid) {
		// TODO Auto-generated method stub
		return mbTransDetailMapper.deleteByPrimaryKey(tdid);
	}

	
	

}
