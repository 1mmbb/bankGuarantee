package cn.edu.nuc.ssm.dao;

import java.util.List;

import cn.edu.nuc.ssm.entity.MbTransType;

public interface MbTransTypeMapper {
    int deleteByPrimaryKey(Integer ttid);

    int insert(MbTransType record);

    int insertSelective(MbTransType record);

    MbTransType selectByPrimaryKey(Integer ttid);
    
    List<MbTransType> selectAllTransType();

    int updateByPrimaryKeySelective(MbTransType record);

    int updateByPrimaryKey(MbTransType record);
}