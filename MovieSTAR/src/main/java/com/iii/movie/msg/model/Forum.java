package com.iii.movie.msg.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity
@Component
public class Forum {

	@Id 
	@Column(name = "FID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer fid;
	
	@Column(name = "ACCOUNT" ,columnDefinition = "NVARCHAR(max)") //會員
	private String account;
	
	@Column(columnDefinition = "nvarchar(max)" , name = "TAG") //分類
	private String tag;
	
	@Column(columnDefinition = "nvarchar(max)" , name = "THEME") //標籤
	private String theme;
	
	@Column(columnDefinition = "nvarchar(max)" , name = "ARTICLE") //文章主題
	private String article;
	
	@Column(columnDefinition = "nvarchar(max)" , name = "CONTENT") //文章內容
	private String content;
	
	@Transient //不建立欄位
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@Column(name = "FTIME") //發表時間
	private String ftime = sdf.format(new Date());
	
	@Column(columnDefinition = "nvarchar(max)" , name = "FMOVIE") //電影類型
	private String fmovie;
	
	@Column(name = "PRESTIGE") //回覆統計
	private Integer prestige;
	
	@Column(name = "FREPORT",columnDefinition = "NVARCHAR(max)") //檢舉內容
	private String freport;
	
	@Column(name = "FDEL",columnDefinition = "NVARCHAR(max)") //狀態
	private Integer fdel;
	
	@Column(name = "ROOM")
	private Integer room;
	
	@Transient //不建立欄位
	private SimpleDateFormat roomtime = new SimpleDateFormat("HH:mm");

	@Column(name = "RTIME") //發表時間
	private String rtime = roomtime.format(new Date());
	
	@Column(name = "MY",columnDefinition = "NVARCHAR(max)")
	private String my;
	
	@Column(name = "ADMIN",columnDefinition = "NVARCHAR(max)")
	private String admin;
	
	
	//多少
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER )
	@JoinColumn(name = "FK_MSG")
	private List<Message> msg;
	
	
	public Forum() {
		
	}
	
	public Forum(Integer fid) {
		this.fid = fid;
	}

	public Integer getFid() {
		return fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getArticle() {
		return article;
	}

	public void setArticle(String article) {
		this.article = article;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFtime() {
		return ftime;
	}

	public void setFtime(String ftime) {
		this.ftime = ftime;
	}

	public String getFmovie() {
		return fmovie;
	}

	public void setFmovie(String fmovie) {
		this.fmovie = fmovie;
	}
	

	public Integer getPrestige() {
		return prestige;
	}

	public void setPrestige(Integer prestige) {
		this.prestige = prestige;
	}

	public String getFreport() {
		return freport;
	}

	public void setFreport(String freport) {
		this.freport = freport;
	}

	public Integer getFdel() {
		return fdel;
	}

	public void setFdel(Integer fdel) {
		this.fdel = fdel;
	}

	public List<Message> getMsg() {
		return msg;
	}

	public void setMsg(List<Message> msg) {
		this.msg = msg;
	}	


	public Integer getRoom() {
		return room;
	}

	public void setRoom(Integer room) {
		this.room = room;
	}

	public String getRtime() {
		return rtime;
	}

	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	
	

	public String getMy() {
		return my;
	}

	public void setMy(String my) {
		this.my = my;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "Forum [fid=" + fid + ", account=" + account + ", tag=" + tag + ", theme=" + theme + ", article="
				+ article + ", content=" + content + ", sdf=" + sdf + ", ftime=" + ftime + ", fmovie=" + fmovie
				+ ", prestige=" + prestige + ", freport=" + freport + ", fdel=" + fdel + ", room=" + room
				+ ", roomtime=" + roomtime + ", rtime=" + rtime + ", my=" + my + ", admin=" + admin + ", msg=" + msg
				+ "]";
	}

	

	


	
}
