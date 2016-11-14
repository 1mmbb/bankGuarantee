package cn.edu.nuc.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nuc.ssm.dao.MbSysroleMapper;
import cn.edu.nuc.ssm.dao.MbSysuserMapper;
import cn.edu.nuc.ssm.dto.PageInfo;
import cn.edu.nuc.ssm.entity.MbSysrole;
import cn.edu.nuc.ssm.entity.MbSysuser;
import cn.edu.nuc.ssm.service.interfaces.MbUserService;



@Service
public class MbUserServiceImpl implements MbUserService {

	@Autowired
	private MbSysuserMapper mbSysuserMapper;
	@Autowired
	private MbSysroleMapper mbSysroleMapper;
	
	public MbSysuser login(String username, String userpwd) {
		
		MbSysuser user = mbSysuserMapper.selectByUname(username);
		
		if( user == null ){
			//throw new RuntimeException("用户名或密码不正确");
			return null;
		} else if( ! userpwd.equals( user.getUserpwd() ) ){
			return null;
		}
		
		return user;
	}

	@Override
	public int addUser(MbSysuser mbSysuser) {
	/*	MbSysrole role = mbSysroleMapper.selectByRoleName(mbSysuser.getRolename());
		if(role==null){
			return 0;
		}else {
			mbSysuser.setRoleid(role.getRoleid());
			
			System.out.println("+++++"+mbSysuser);*/
			return mbSysuserMapper.insertSelective(mbSysuser);
	}

	@Override
	public PageInfo selectAllUser(String username, int current) {
		PageInfo pi = new PageInfo(current);
		
		List<MbSysuser> userlist = null;
		List<MbSysuser> userlist2 = null;
		if(username != null && !username.equals("")){
			String name = "%"+username+"%";
			MbSysuser mbSysuser = new MbSysuser();
			mbSysuser.setUsername(name);
			userlist = mbSysuserMapper.selectAllUser(mbSysuser);
			userlist2 = mbSysuserMapper.selectAllUserPage(name, pi.getStart(), pi.getOffset());
		}else{
			userlist = mbSysuserMapper.selectAllUser(null);
			userlist2 = mbSysuserMapper.selectAllUserPage(null, pi.getStart(), pi.getOffset());
		}
		pi.setCount( userlist.size() );
		pi.setList(userlist2);
		
		return pi;
	}

	@Override
	public int deleteUser(int userid) {
		// TODO Auto-generated method stub
		return mbSysuserMapper.deleteByPrimaryKey(userid);
	}

	@Override
	public MbSysuser selectUserByid(int userid) {
		MbSysuser mbSysuser = mbSysuserMapper.selectByPrimaryKey(userid);
		return mbSysuser;
	}

	@Override
	public List<MbSysrole> selectAllRole() {
		// TODO Auto-generated method stub
		return mbSysroleMapper.selectAllRole(null);
	}

	@Override
	public int editUser(MbSysuser mbSysuser) {
		
		return mbSysuserMapper.updateByPrimaryKeySelective(mbSysuser);
	}

}
