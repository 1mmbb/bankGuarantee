package cn.edu.nuc.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.nuc.ssm.entity.MbSysuser;

public interface MbSysuserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(MbSysuser record);

    int insertSelective(MbSysuser record);

    MbSysuser selectByPrimaryKey(Integer userid);
    
    MbSysuser selectByUname(String username);
    
    //查询所有用户
  	List<MbSysuser> selectAllUserPage(@Param("name") String name, @Param("start") int start, @Param("offset")int offset); 

  	List<MbSysuser> selectAllUser(MbSysuser record);
  	
  	
    int updateByPrimaryKeySelective(MbSysuser record);

    int updateByPrimaryKey(MbSysuser record);
}