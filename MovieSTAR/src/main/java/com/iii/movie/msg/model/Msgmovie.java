package com.iii.movie.msg.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity
public class Msgmovie {

	@Id
	@Column(name = "MID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mid;
	
	@Column(columnDefinition = "NVARCHAR(max)" , name = "ACCOUNT")
	private String account;//fk
	
	@Column(columnDefinition = "NVARCHAR(max)" , name = "MCONTENT")
	private String mcontent;
	
	@Column(columnDefinition = "NVARCHAR(max)" , name = "MMOVIE")
	private String mmovie;
	
	@Transient //不建立欄位
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@Column(name = "MTIME")
	private String mtime = sdf.format(new Date());
	
	@Column(name = "MSTAR",columnDefinition = "NVARCHAR(max)")
	private String mstar;
	
	@Column(name = "STATISTIC") 
	private Integer statistic;
	
	@Column(name = "MREPORT",columnDefinition = "NVARCHAR(max)")
	private String mreport;
	
	@Column(name = "MDEL",columnDefinition = "NVARCHAR(max)")
	private String mdel;

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getMcontent() {
		return mcontent;
	}

	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}

	public String getMmovie() {
		return mmovie;
	}

	public void setMmovie(String mmovie) {
		this.mmovie = mmovie;
	}

	public String getMtime() {
		return mtime;
	}

	public void setMtime(String mtime) {
		this.mtime = mtime;
	}

	public String getMstar() {
		return mstar;
	}

	public void setMstar(String mstar) {
		this.mstar = mstar;
	}

	public String getMreport() {
		return mreport;
	}

	public void setMreport(String mreport) {
		this.mreport = mreport;
	}

	public String getMdel() {
		return mdel;
	}

	public void setMdel(String mdel) {
		this.mdel = mdel;
	}

	public Integer getStatistic() {
		return statistic;
	}

	public void setStatistic(Integer statistic) {
		this.statistic = statistic;
	}

	@Override
	public String toString() {
		return "Msgmovie [mid=" + mid + ", account=" + account + ", mcontent=" + mcontent + ", mmovie=" + mmovie
				+ ", mtime=" + mtime + ", mstar=" + mstar + ", statistic=" + statistic + ", mreport=" + mreport
				+ ", mdel=" + mdel + "]";
	}

	
	
}
