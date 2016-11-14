package cn.edu.nuc.ssm.entity;

public class MbNotice {
    private Integer niticeid;

    private Integer roleid;
//公告内容
    private String noticecon;
//发布公告时间
    private String noticetime;
    
    private String rolename;
    
   

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public Integer getNiticeid() {
        return niticeid;
    }

    public void setNiticeid(Integer niticeid) {
        this.niticeid = niticeid;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getNoticecon() {
        return noticecon;
    }

    public void setNoticecon(String noticecon) {
        this.noticecon = noticecon == null ? null : noticecon.trim();
    }

    public String getNoticetime() {
        return noticetime;
    }

    public void setNoticetime(String noticetime) {
        this.noticetime = noticetime == null ? null : noticetime.trim();
    }
}