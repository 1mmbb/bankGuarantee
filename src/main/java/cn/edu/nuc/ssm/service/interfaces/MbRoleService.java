package cn.edu.nuc.ssm.service.interfaces;

import java.util.List;

import cn.edu.nuc.ssm.dto.PageInfo;
import cn.edu.nuc.ssm.entity.MbRoleright;
import cn.edu.nuc.ssm.entity.MbSysfunction;
import cn.edu.nuc.ssm.entity.MbSysrole;
import cn.edu.nuc.ssm.entity.MbSysuser;

public interface MbRoleService {
	
	
	
	
    //查询所有角色
    PageInfo selectAllRole(String rolename, int current);
    
    // 添加角色
 	int addRole(MbSysrole mbSysrole);
 	
 	//根据角色id查找
 	MbSysrole selectRoleByid(int roleid);
 	
 	//编辑用户
 	int editRole(MbSysrole mbSysrole);
 	
 	//初始化权限分配
 	List<MbSysfunction> initroleright(int roleid);
 	
 	//保存权限分配
 	int saveright(String roleid, String[] funids);

}
