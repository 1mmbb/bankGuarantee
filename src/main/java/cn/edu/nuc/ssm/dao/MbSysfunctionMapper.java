package cn.edu.nuc.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.nuc.ssm.entity.MbSysfunction;
import cn.edu.nuc.ssm.entity.MbSysuser;

public interface MbSysfunctionMapper {
    int deleteByPrimaryKey(Integer funid);

    int insert(MbSysfunction record);

    int insertSelective(MbSysfunction record);

    MbSysfunction selectByPrimaryKey(Integer funid);
    
    //超级管理员查找出所有可用功能
    List<MbSysfunction> selectAllNormalFunction();
    
    //查询出角色对应的功能
    List<MbSysfunction> selectRoleFun(int roleid);
    
    
    //查询所有用户
  	List<MbSysfunction> selectAllFunctionPage(@Param("name") String name, @Param("start") int start, @Param("offset")int offset); 

  	List<MbSysfunction> selectAllFunction(MbSysfunction record);
  	
  	List<MbSysfunction> initfunlist(int roleid);
  	
    int updateByPrimaryKeySelective(MbSysfunction record);

    int updateByPrimaryKey(MbSysfunction record);
}