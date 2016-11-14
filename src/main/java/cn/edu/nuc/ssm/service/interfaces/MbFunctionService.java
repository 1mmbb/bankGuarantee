package cn.edu.nuc.ssm.service.interfaces;

import java.util.List;

import cn.edu.nuc.ssm.dto.PageInfo;
import cn.edu.nuc.ssm.entity.MbSysfunction;
import cn.edu.nuc.ssm.entity.MbSysuser;

public interface MbFunctionService {
	
	
	//超级管理员查找出所有可用功能
    List<MbSysfunction> selectAllNormalFunction();
	
    //查询所有功能
    PageInfo selectAllFunction(String funname, int current);
    
    //查询角色对于功能
    List<MbSysfunction> selectRoleFun(int roleid);
    
    // 添加用户
 	int addFunction(MbSysfunction mbSysfunction);
 	
 	//根据功能id查找
 	MbSysfunction selectFunctionByid(int funid);
 	
 	//编辑用户
 	int editFunction(MbSysfunction mbSysfunction);

}
