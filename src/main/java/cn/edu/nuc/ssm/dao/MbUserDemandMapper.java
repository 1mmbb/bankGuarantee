package cn.edu.nuc.ssm.dao;

import java.util.List;

import cn.edu.nuc.ssm.entity.MbUserDemand;

public interface MbUserDemandMapper {
    int deleteByPrimaryKey(Integer udid);

    int insert(MbUserDemand record);

    int insertSelective(MbUserDemand record);

    MbUserDemand selectByPrimaryKey(Integer udid);
    
    //查询出与deid相关的所有处理
    List<MbUserDemand> selectUserDemand(int deid);

    int updateByPrimaryKeySelective(MbUserDemand record);

    int updateByPrimaryKey(MbUserDemand record);
}