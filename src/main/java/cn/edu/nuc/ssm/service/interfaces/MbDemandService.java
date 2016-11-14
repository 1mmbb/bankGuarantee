package cn.edu.nuc.ssm.service.interfaces;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.nuc.ssm.dto.PageInfo;
import cn.edu.nuc.ssm.dto.Statistics;
import cn.edu.nuc.ssm.entity.MbDemand;
import cn.edu.nuc.ssm.entity.MbSysrole;
import cn.edu.nuc.ssm.entity.MbSysuser;
import cn.edu.nuc.ssm.entity.MbTransDetail;
import cn.edu.nuc.ssm.entity.MbTransType;
import cn.edu.nuc.ssm.entity.MbUserDemand;

public interface MbDemandService {
	
	//加载 事务种类 列表
	List<MbTransType> selectAllTransType();
	
	//根据事务种类id 查询 事务详情
	List<MbTransDetail> selectTDname(int ttid);
	
	//根据事务明细id查出 事务明细
	MbTransDetail selectTdetails(int tdid);
	
	//添加新需求申报
	int addDemand(MbDemand mbDemand);
	
	//查找出所有 未办理完结的需求
    List<MbDemand> selectDemandNotOver();
    
    //查找出所有办理完结的需求
    List<MbDemand> selectDemandOver();
    
    //根据id查询出 需求详细信息
    MbDemand selectDemandByid(int deid);
    
    //根据主键查询出 事务明细
  	MbTransDetail selectByTDid(int tdid);
  
    //添加用户处理需求 催办
  	int addUserDemand(MbUserDemand mbUserDemand);
  	
  //添加用户处理需求 审核
  	int addshenhe(MbUserDemand mbUserDemand);
  	
  //添加用户处理需求 处理
  	int addchuli(MbUserDemand mbUserDemand);
  	
  //添加用户处理需求 办结
  	int addbanjie(MbUserDemand mbUserDemand);
  	
  //回收用户需求
  	int huishou(int deid);
  	
    //查询用户处理需求
  	List<MbUserDemand> selectUserDemand(int deid);
  	
  	List<MbDemand> selectAllDemand(Statistics statistics);
}
