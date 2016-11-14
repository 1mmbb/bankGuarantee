package cn.edu.nuc.ssm.dao;

import java.util.List;

import cn.edu.nuc.ssm.dto.Statistics;
import cn.edu.nuc.ssm.entity.MbDemand;

public interface MbDemandMapper {
    int deleteByPrimaryKey(Integer deid);

    int insert(MbDemand record);

    int insertSelective(MbDemand record);

    MbDemand selectByPrimaryKey(Integer deid);
    
    List<MbDemand> selectAllDemand(Statistics statistics);
    
    //查找出所有 未办理完结的需求
    List<MbDemand> selectDemandNotOver();
    
    //查找出所有办理完结的需求
    List<MbDemand> selectDemandOver();
    
    //根据主键 查出需求详细信息
    MbDemand selectDemandByid(Integer deid);

    int updateByPrimaryKeySelective(MbDemand record);

    int updateByPrimaryKey(MbDemand record);
}