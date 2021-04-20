package com.iii.movie.msg.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity
@Component
public class Message {

	@Id
	@Column(name = "MID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mid;
	
	@Column(name = "ACCOUNT" ,columnDefinition = "NVARCHAR(max)") //會員
	private String account;
	
	@Column(name = "MCONTENT" ,columnDefinition = "NVARCHAR(max)") //內容
	private String mcontent;

	@Transient //不建立欄位
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	@Column(name = "MTIME") //留言時間
	private String mtime = sdf.format(new Date());
	
	@Column(name = "BLOCKADE",columnDefinition = "NVARCHAR(max)")
	private String blockade;
	
	@Transient
	private Integer fk;
	
	public Message() {

		
	}
		

	public Message(String account, String mcontent, String blockade) {
		this.account = account;
		this.mcontent = mcontent;
		this.blockade = blockade;
	}





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

	public String getMtime() {
		return mtime;
	}

	public void setMtime(String mtime) {
		this.mtime = mtime;
	}
	

	public String getBlockade() {
		return blockade;
	}


	public void setBlockade(String blockade) {
		this.blockade = blockade;
	}


	public Integer getFk() {
		return fk;
	}


	public void setFk(Integer fk) {
		this.fk = fk;
	}


	@Override
	public String toString() {
		return "Message [mid=" + mid + ", account=" + account + ", mcontent=" + mcontent + ", mtime=" + mtime
				+ ", blockade=" + blockade + "]";
	}


	
}
