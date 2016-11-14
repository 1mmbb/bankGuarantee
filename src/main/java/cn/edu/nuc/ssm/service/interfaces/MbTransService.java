package cn.edu.nuc.ssm.service.interfaces;

import java.util.List;

import cn.edu.nuc.ssm.dto.PageInfo;
import cn.edu.nuc.ssm.entity.MbSysrole;
import cn.edu.nuc.ssm.entity.MbSysuser;
import cn.edu.nuc.ssm.entity.MbTransDetail;
import cn.edu.nuc.ssm.entity.MbTransType;

public interface MbTransService {
	
	//加载 事务种类 列表
	List<MbTransType> selectAllTransType();
	
	//添加 事务种类
	int addTransType(MbTransType mbTransType);
	
	//删除 事务种类
	int delTransType(Integer ttid);
	
	//查询所有 事务明细
	PageInfo selectAllTD(String ttname, int current);
	
	//添加 事务明细
	int addTrans(MbTransDetail mbTransDetail);
	
	//根据主键查询出 事务明细
	MbTransDetail selectByTDid(int tdid);
	
	//删除 事务明细
	int delTrans(Integer tdid);

}
