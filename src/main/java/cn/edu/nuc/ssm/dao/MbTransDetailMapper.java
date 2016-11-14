package cn.edu.nuc.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.nuc.ssm.entity.MbTransDetail;

public interface MbTransDetailMapper {
    int deleteByPrimaryKey(Integer tdid);

    int insert(MbTransDetail record);

    int insertSelective(MbTransDetail record);

    MbTransDetail selectByPrimaryKey(Integer tdid);
    
    //查询所有用户明细
  	List<MbTransDetail> selectAllTDPage(@Param("name") String name, @Param("start") int start, @Param("offset")int offset); 

  	List<MbTransDetail> selectAllTD(MbTransDetail record);
  	
  	List<MbTransDetail> selectTdNameByttid(int ttid);

    int updateByPrimaryKeySelective(MbTransDetail record);

    int updateByPrimaryKey(MbTransDetail record);
}