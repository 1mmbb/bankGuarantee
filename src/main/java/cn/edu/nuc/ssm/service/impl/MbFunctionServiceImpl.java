package cn.edu.nuc.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nuc.ssm.dao.MbSysfunctionMapper;
import cn.edu.nuc.ssm.dto.PageInfo;
import cn.edu.nuc.ssm.entity.MbSysfunction;
import cn.edu.nuc.ssm.entity.MbSysuser;
import cn.edu.nuc.ssm.service.interfaces.MbFunctionService;



@Service
public class MbFunctionServiceImpl implements MbFunctionService {

	@Autowired
	private MbSysfunctionMapper mbSysfunctionMapper;

	@Override
	public List<MbSysfunction> selectAllNormalFunction() {
		return mbSysfunctionMapper.selectAllNormalFunction();
	}

	@Override
	public PageInfo selectAllFunction(String funname, int current) {
		PageInfo pi = new PageInfo(current);
		
		List<MbSysfunction> funlist = null;
		List<MbSysfunction> funlist2 = null;
		if(funname != null && !funname.equals("")){
			String name = "%"+funname+"%";
			MbSysfunction mbSysfunction = new MbSysfunction();
			mbSysfunction.setFunname(name);
			funlist = mbSysfunctionMapper.selectAllFunction(mbSysfunction);
			funlist2 = mbSysfunctionMapper.selectAllFunctionPage(name, pi.getStart(), pi.getOffset());
		}else{
			funlist = mbSysfunctionMapper.selectAllFunction(null);
			funlist2 = mbSysfunctionMapper.selectAllFunctionPage(null, pi.getStart(), pi.getOffset());
		}
		pi.setCount( funlist.size() );
		pi.setList(funlist2);
		
		return pi;
	}

	@Override
	public int addFunction(MbSysfunction mbSysfunction) {
		int count = mbSysfunctionMapper.insertSelective(mbSysfunction);
		return count;
	}

	@Override
	public MbSysfunction selectFunctionByid(int funid) {
		MbSysfunction mbSysfunction = mbSysfunctionMapper.selectByPrimaryKey(funid);
		return mbSysfunction;
	}

	@Override
	public int editFunction(MbSysfunction mbSysfunction) {
		// TODO Auto-generated method stub
		return mbSysfunctionMapper.updateByPrimaryKeySelective(mbSysfunction);
	}

	@Override
	public List<MbSysfunction> selectRoleFun(int roleid) {
		return mbSysfunctionMapper.selectRoleFun(roleid);
	}
	
	

}
