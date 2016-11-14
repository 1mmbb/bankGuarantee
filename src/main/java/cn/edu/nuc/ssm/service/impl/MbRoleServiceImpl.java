package cn.edu.nuc.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.nuc.ssm.dao.MbRolerightMapper;
import cn.edu.nuc.ssm.dao.MbSysfunctionMapper;
import cn.edu.nuc.ssm.dao.MbSysroleMapper;
import cn.edu.nuc.ssm.dto.PageInfo;
import cn.edu.nuc.ssm.entity.MbRoleright;
import cn.edu.nuc.ssm.entity.MbSysfunction;
import cn.edu.nuc.ssm.entity.MbSysrole;
import cn.edu.nuc.ssm.entity.MbSysuser;
import cn.edu.nuc.ssm.service.interfaces.MbFunctionService;
import cn.edu.nuc.ssm.service.interfaces.MbRoleService;



@Service
public class MbRoleServiceImpl implements MbRoleService {

	@Autowired
	private MbSysroleMapper mbSysroleMapper;
	@Autowired
	private MbSysfunctionMapper mbSysfunctionMapper;
	@Autowired
	private MbRolerightMapper mbRolerightMapper;
	
	@Override
	public PageInfo selectAllRole(String rolename, int current) {
		PageInfo pi = new PageInfo(current);
		
		List<MbSysrole> rolelist = null;
		List<MbSysrole> rolelist2 = null;
		if(rolename != null && !rolename.equals("")){
			String name = "%"+rolename+"%";
			MbSysrole mbSysrole = new MbSysrole();
			mbSysrole.setRolename(name);
			rolelist = mbSysroleMapper.selectAllRole(mbSysrole);
			rolelist2 = mbSysroleMapper.selectAllRolePage(name, pi.getStart(), pi.getOffset());
		}else{
			rolelist = mbSysroleMapper.selectAllRole(null);
			rolelist2 = mbSysroleMapper.selectAllRolePage(null, pi.getStart(), pi.getOffset());
		}
		pi.setCount( rolelist.size() );
		pi.setList(rolelist2);
		
		return pi;
	}

	@Override
	public int addRole(MbSysrole mbSysrole) {
		int count = mbSysroleMapper.insertSelective(mbSysrole);
		return count;
	}

	@Override
	public MbSysrole selectRoleByid(int roleid) {
		MbSysrole mbSysrole = mbSysroleMapper.selectByPrimaryKey(roleid);
		return mbSysrole;
	}

	@Override
	public int editRole(MbSysrole mbSysrole) {
		return mbSysroleMapper.updateByPrimaryKeySelective(mbSysrole);
	}

	@Override
	public List<MbSysfunction> initroleright(int roleid) {
		List<MbSysfunction> funlist = mbSysfunctionMapper.initfunlist(roleid);
		return funlist;
	}
	
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public int saveright(String roleid, String[] funids) {
		int roleid2 = Integer.valueOf(roleid);
		int count = mbRolerightMapper.deleteByRoleid(roleid2);
		MbRoleright mbRoleright = new MbRoleright();
		if(funids!=null){
			for(int i=0;i<funids.length;i++){
				System.out.println("=="+funids[i]);
				int funid = Integer.valueOf(funids[i]);
				mbRoleright.setRoleid(roleid2);
				mbRoleright.setFunid(funid);
				count = mbRolerightMapper.insert(mbRoleright);
			}
		}
		return count;
	}
	
	

}
