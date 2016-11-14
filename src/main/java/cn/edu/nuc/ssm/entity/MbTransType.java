package cn.edu.nuc.ssm.entity;

public class MbTransType {
	//事务种类id
    private Integer ttid;
    //事物种类名称
    private String ttname;

    public Integer getTtid() {
        return ttid;
    }

    public void setTtid(Integer ttid) {
        this.ttid = ttid;
    }

    public String getTtname() {
        return ttname;
    }

    public void setTtname(String ttname) {
        this.ttname = ttname == null ? null : ttname.trim();
    }
}