package cn.edu.nuc.ssm.entity;

public class MbDemand {
	//需求id
    private Integer deid;
    //事务明细id
    private Integer tdid;
    //需求处理部门
    private String handleDepart;
     //需求申报点
    private String dedeclare;
//需求申报人姓名
    private String declareName;
//需求申报人电话
    private String declareTel;
//需求状态(0未审核  1（已审核）待处理   2（已处理）待办结    3以办结)
    private Integer destate;
//超时时间
    private String overTime;
//催办次数
    private Integer reminders;
//上报时间
    private String reportTime;
//是否提交行长
    private Integer ifsubmit;
//是否初审(0未初审、1通过初审)
    private Integer iftrial;
//需求事项描述
    private String dedescription;
   //事务种类名称
    private String ttname;
    //事务详细名称
    private String tdname;
   
    
    public String getTtname() {
		return ttname;
	}

	public void setTtname(String ttname) {
		this.ttname = ttname;
	}

	public String getTdname() {
		return tdname;
	}

	public void setTdname(String tdname) {
		this.tdname = tdname;
	}

	public Integer getDeid() {
        return deid;
    }

    public void setDeid(Integer deid) {
        this.deid = deid;
    }

    public Integer getTdid() {
        return tdid;
    }

    public void setTdid(Integer tdid) {
        this.tdid = tdid;
    }

    public String getHandleDepart() {
        return handleDepart;
    }

    public void setHandleDepart(String handleDepart) {
        this.handleDepart = handleDepart == null ? null : handleDepart.trim();
    }

    public String getDedeclare() {
        return dedeclare;
    }

    public void setDedeclare(String dedeclare) {
        this.dedeclare = dedeclare == null ? null : dedeclare.trim();
    }

    public String getDeclareName() {
        return declareName;
    }

    public void setDeclareName(String declareName) {
        this.declareName = declareName == null ? null : declareName.trim();
    }

    public String getDeclareTel() {
        return declareTel;
    }

    public void setDeclareTel(String declareTel) {
        this.declareTel = declareTel == null ? null : declareTel.trim();
    }

    public Integer getDestate() {
        return destate;
    }

    public void setDestate(Integer destate) {
        this.destate = destate;
    }

    public String getOverTime() {
        return overTime;
    }

    public void setOverTime(String overTime) {
        this.overTime = overTime == null ? null : overTime.trim();
    }

    public Integer getReminders() {
        return reminders;
    }

    public void setReminders(Integer reminders) {
        this.reminders = reminders;
    }

    public String getReportTime() {
        return reportTime;
    }

    public void setReportTime(String reportTime) {
        this.reportTime = reportTime == null ? null : reportTime.trim();
    }

    public Integer getIfsubmit() {
        return ifsubmit;
    }

    public void setIfsubmit(Integer ifsubmit) {
        this.ifsubmit = ifsubmit;
    }

    public Integer getIftrial() {
        return iftrial;
    }

    public void setIftrial(Integer iftrial) {
        this.iftrial = iftrial;
    }

    public String getDedescription() {
        return dedescription;
    }

    public void setDedescription(String dedescription) {
        this.dedescription = dedescription == null ? null : dedescription.trim();
    }
}