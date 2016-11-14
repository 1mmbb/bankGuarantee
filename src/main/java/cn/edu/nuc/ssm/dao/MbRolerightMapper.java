package cn.edu.nuc.ssm.dao;

import cn.edu.nuc.ssm.entity.MbRoleright;

public interface MbRolerightMapper {
    int deleteByPrimaryKey(Integer rrid);
    
    int deleteByRoleid(Integer roleid);

    int insert(MbRoleright record);

    int insertSelective(MbRoleright record);

    MbRoleright selectByPrimaryKey(Integer rrid);

    int updateByPrimaryKeySelective(MbRoleright record);

    int updateByPrimaryKey(MbRoleright record);
}