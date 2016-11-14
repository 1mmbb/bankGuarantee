package cn.edu.nuc.ssm.service.interfaces;

import java.util.List;

import cn.edu.nuc.ssm.entity.MbNotice;

public interface MbNoticeService {
	
	//加载 公告 列表
	List<MbNotice> selectAllNotice();
	
	//添加公告
	int addNotice(MbNotice mbNotice,int userid);
	
	//删除公告
	int delNotice(int noticeid);
	
}
