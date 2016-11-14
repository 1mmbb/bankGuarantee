package cn.edu.nuc.ssm.entity;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class MbSysuser {
    private Integer userid;

    private Integer roleid;

    @NotEmpty(message="用户名不能为空")
    @NotNull(message="用户名不能为空")
    private String username;

    @NotEmpty(message="密码不能为空")
    @NotNull(message="密码不能为空")
    private String userpwd;

    private String usertruename;

    private Integer userstate;
    
    private String rolename;
    
    

    public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getUserpwd() {
        return userpwd;
    }

    public void setUserpwd(String userpwd) {
        this.userpwd = userpwd == null ? null : userpwd.trim();
    }

    public String getUsertruename() {
        return usertruename;
    }

    public void setUsertruename(String usertruename) {
        this.usertruename = usertruename == null ? null : usertruename.trim();
    }

    public Integer getUserstate() {
        return userstate;
    }

    public void setUserstate(Integer userstate) {
        this.userstate = userstate;
    }

	@Override
	public String toString() {
		return "MbSysuser [userid=" + userid + ", roleid=" + roleid + ", username=" + username + ", userpwd=" + userpwd
				+ ", usertruename=" + usertruename + ", userstate=" + userstate + ", rolename=" + rolename + "]";
	}
    
    
    
}