package cn.edu.nuc.ssm.entity;

public class MbTransDetail {
	//事务明细id
    private Integer tdid;
//事物种类id
    private Integer ttid;
//事务种类名称
    private String ttname;
//事务明细名称
    private String tdname;
   //事务类型
    private String tdtype;
   
//服务保障部门
    private String tddepat;
//服务保障级别
    private String tdlevel;
//涉及外包服务商
    private String tdifout;
//初审时限
    private String firstTime;
//响应时限
    private String responseTime;
//抵达现场时限
    private String arriveTime;
//服务解决时限
    private String serviceTime;
//事务备注
    private String tdremarks;

    
    
    public String getTdtype() {
		return tdtype;
	}

	public void setTdtype(String tdtype) {
		this.tdtype = tdtype;
	}

	public String getTtname() {
		return ttname;
	}

	public void setTtname(String ttname) {
		this.ttname = ttname;
	}

	public Integer getTdid() {
        return tdid;
    }

    public void setTdid(Integer tdid) {
        this.tdid = tdid;
    }

    public Integer getTtid() {
        return ttid;
    }

    public void setTtid(Integer ttid) {
        this.ttid = ttid;
    }

    public String getTdname() {
        return tdname;
    }

    public void setTdname(String tdname) {
        this.tdname = tdname == null ? null : tdname.trim();
    }

    public String getTddepat() {
        return tddepat;
    }

    public void setTddepat(String tddepat) {
        this.tddepat = tddepat == null ? null : tddepat.trim();
    }

    public String getTdlevel() {
        return tdlevel;
    }

    public void setTdlevel(String tdlevel) {
        this.tdlevel = tdlevel == null ? null : tdlevel.trim();
    }

    public String getTdifout() {
        return tdifout;
    }

    public void setTdifout(String tdifout) {
        this.tdifout = tdifout == null ? null : tdifout.trim();
    }

    public String getFirstTime() {
        return firstTime;
    }

    public void setFirstTime(String firstTime) {
        this.firstTime = firstTime == null ? null : firstTime.trim();
    }

    public String getResponseTime() {
        return responseTime;
    }

    public void setResponseTime(String responseTime) {
        this.responseTime = responseTime == null ? null : responseTime.trim();
    }

    public String getArriveTime() {
        return arriveTime;
    }

    public void setArriveTime(String arriveTime) {
        this.arriveTime = arriveTime == null ? null : arriveTime.trim();
    }

    public String getServiceTime() {
        return serviceTime;
    }

    public void setServiceTime(String serviceTime) {
        this.serviceTime = serviceTime == null ? null : serviceTime.trim();
    }

    public String getTdremarks() {
        return tdremarks;
    }

    public void setTdremarks(String tdremarks) {
        this.tdremarks = tdremarks == null ? null : tdremarks.trim();
    }
}