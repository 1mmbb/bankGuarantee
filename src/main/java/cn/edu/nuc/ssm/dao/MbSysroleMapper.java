package cn.edu.nuc.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.nuc.ssm.entity.MbSysfunction;
import cn.edu.nuc.ssm.entity.MbSysrole;

public interface MbSysroleMapper {
    int deleteByPrimaryKey(Integer roleid);

    int insert(MbSysrole record);

    int insertSelective(MbSysrole record);

    MbSysrole selectByPrimaryKey(Integer roleid);
    
    MbSysrole selectByRoleName(String rolename);
        
    //查询所有功能
  	List<MbSysrole> selectAllRolePage(@Param("name") String name, @Param("start") int start, @Param("offset")int offset); 

  	List<MbSysrole> selectAllRole(MbSysrole record);

    int updateByPrimaryKeySelective(MbSysrole record);

    int updateByPrimaryKey(MbSysrole record);
}