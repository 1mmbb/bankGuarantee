package cn.edu.nuc.ssm.entity;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class MbSysfunction {
    private Integer funid;

    @NotEmpty(message="用户名不能为空")
    @NotNull(message="用户名不能为空")
    private String funname;

    private String funurl;

    private Integer funpid;

    private Integer funstate;
    
    private String funpname;
    
    private Integer rr;
    
    public Integer getRr() {
		return rr;
	}

	public void setRr(Integer rr) {
		this.rr = rr;
	}

    public String getFunpname() {
		return funpname;
	}

	public void setFunpname(String funpname) {
		this.funpname = funpname;
	}

	public Integer getFunid() {
        return funid;
    }

    public void setFunid(Integer funid) {
        this.funid = funid;
    }

    public String getFunname() {
        return funname;
    }

    public void setFunname(String funname) {
        this.funname = funname == null ? null : funname.trim();
    }

    public String getFunurl() {
        return funurl;
    }

    public void setFunurl(String funurl) {
        this.funurl = funurl == null ? null : funurl.trim();
    }

    public Integer getFunpid() {
        return funpid;
    }

    public void setFunpid(Integer funpid) {
        this.funpid = funpid;
    }

    public Integer getFunstate() {
        return funstate;
    }

    public void setFunstate(Integer funstate) {
        this.funstate = funstate;
    }
}