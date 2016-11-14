package cn.edu.nuc.ssm.service.interfaces;

import java.util.List;

import cn.edu.nuc.ssm.dto.PageInfo;
import cn.edu.nuc.ssm.entity.MbSysrole;
import cn.edu.nuc.ssm.entity.MbSysuser;

public interface MbUserService {
	
	// 用户登录	
	MbSysuser login(String username, String userpwd);
	
	// 添加用户
	int addUser(MbSysuser mbSysuser);
	
	//查询所有用户
	PageInfo selectAllUser(String username, int current); 
	
	//根据用户id查询用户
	MbSysuser selectUserByid(int userid);
	
	//查询所有角色
	List<MbSysrole> selectAllRole();
	
	//编辑用户
	int editUser(MbSysuser mbSysuser);
	
	//删除用户
	int deleteUser(int userid);
	

}
