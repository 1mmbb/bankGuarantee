package cn.edu.nuc.ssm.dao;

import java.util.List;

import cn.edu.nuc.ssm.entity.MbNotice;

public interface MbNoticeMapper {
    int deleteByPrimaryKey(Integer niticeid);

    int insert(MbNotice record);

    int insertSelective(MbNotice record);

    MbNotice selectByPrimaryKey(Integer niticeid);
    
    List<MbNotice> selectAllNotice();

    int updateByPrimaryKeySelective(MbNotice record);

    int updateByPrimaryKey(MbNotice record);
}