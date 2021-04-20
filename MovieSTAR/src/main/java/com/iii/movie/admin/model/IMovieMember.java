package com.iii.movie.admin.model;

import java.util.Arrays;
import java.util.Collection;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="imoviemember")
public class IMovieMember {
	
	@Id
	@Column(unique = true, nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mempk;
	
	@Column
	private String memberid;
	@Column
	private String account;	
	@Column
	private String password;
	@Column
	private String cell;
	@Column
	private boolean enabled;	
	@Column
	private String name;
	@Transient
	private String confirmpassword;
	@Column
	private String permission;
	@JsonIgnore
	private String googleUrl;
	@Column
	private String emailbox;
	@Column
	private Boolean emailActiveStatus;
	
	@ElementCollection(fetch = FetchType.EAGER)
	private Set<String> salary;
	@ElementCollection(fetch = FetchType.EAGER)
	private Set<String> title;
	@ElementCollection(fetch = FetchType.EAGER)
	private Set<String> skill;
	@ElementCollection(fetch = FetchType.EAGER)
	private Set<String> status;
	
	@Column
	private String registerstatus;
	@Column
	private Integer fail_count;
	@Column
	private String fail_time;
	@Column
	private String registerTime;
	@Column
	private String resignTime;
	@Column(columnDefinition = "varbinary(MAX)")
	private byte[] image;
	@Column
	private String image1;
	
	@ManyToMany
	@JoinTable(name = "imoviemembers_roles", 
		joinColumns = @JoinColumn(name = "imoviemember_mempk", referencedColumnName = "mempk"), 
		inverseJoinColumns = @JoinColumn(name = "role_mempk", referencedColumnName = "mempk"))
	@JsonIgnore
	private Collection<Role> roles;
	
	public IMovieMember() {
		super();
		this.enabled = false;
	}
	
	
	public boolean isNew() {
		return (this.mempk == null);
	}
	
	public IMovieMember(String account, String password) {
		this.account = account;
		this.password = password;
	}
	
	
	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getMemberId() {
		return memberid;
	}

	public void setMemberId(String memberId) {
		this.memberid = memberId;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}


	public Set<String> getSalary() {
		return salary;
	}


	public void setSalary(Set<String> salary) {
		this.salary = salary;
	}


	public Set<String> getTitle() {
		return title;
	}


	public void setTitle(Set<String> title) {
		this.title = title;
	}


	public Set<String> getSkill() {
		return skill;
	}


	public void setSkill(Set<String> skill) {
		this.skill = skill;
	}


	public Set<String> getStatus() {
		return status;
	}


	public void setStatus(Set<String> status) {
		this.status = status;
	}


	public String getRegisterTime() {
		return registerTime;
	}


	public void setRegisterTime(String string) {
		this.registerTime = string;
	}


	public String getPermission() {
		return permission;
	}


	public void setPermission(String permission) {
		this.permission = permission;
	}


	public String getGoogleUrl() {
		return googleUrl;
	}


	public void setGoogleUrl(String googleUrl) {
		this.googleUrl = googleUrl;
	}


	public String getEmailbox() {
		return emailbox;
	}


	public void setEmailbox(String emailbox) {
		this.emailbox = emailbox;
	}


	public Boolean getEmailActiveStatus() {
		return emailActiveStatus;
	}


	public void setEmailActiveStatus(Boolean emailActiveStatus) {
		this.emailActiveStatus = emailActiveStatus;
	}
	
	
	public String getRegisterstatus() {
		return registerstatus;
	}

	public void setRegisterstatus(String registerstatus) {
		this.registerstatus = registerstatus;
	}

	public String getResignTime() {
		return resignTime;
	}


	public Integer getMempk() {
		return mempk;
	}


	public void setMempk(Integer mempk) {
		this.mempk = mempk;
	}


	public String getAccount() {
		return account;
	}


	public void setAccount(String account) {
		this.account = account;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getCell() {
		return cell;
	}


	public void setCell(String cell) {
		this.cell = cell;
	}


	public boolean isEnabled() {
		return enabled;
	}


	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getConfirmpassword() {
		return confirmpassword;
	}


	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}


	public Collection<Role> getRoles() {
		return roles;
	}


	public void setRoles(Collection<Role> roles) {
		this.roles = roles;
	}
	
	public Integer getFail_count() {
		return fail_count;
	}

	public void setFail_count(Integer fail_count) {
		this.fail_count = fail_count;
	}

	public String getFail_time() {
		return fail_time;
	}

	public void setFail_time(String fail_time) {
		this.fail_time = fail_time;
	}

	public void setResignTime(String resignTime) {
		this.resignTime = resignTime;
	}

	@Override
	public String toString() {
		return "IMovieMember [mempk=" + mempk + ", memberid=" + memberid + ", account=" + account + ", password="
				+ password + ", cell=" + cell + ", enabled=" + enabled + ", name=" + name + ", confirmpassword="
				+ confirmpassword + ", permission=" + permission + ", googleUrl=" + googleUrl + ", emailbox=" + emailbox
				+ ", emailActiveStatus=" + emailActiveStatus + ", salary=" + salary + ", title=" + title + ", skill="
				+ skill + ", status=" + status + ", registerstatus=" + registerstatus + ", fail_count=" + fail_count
				+ ", fail_time=" + fail_time + ", registerTime=" + registerTime + ", resignTime=" + resignTime
				+ ", image=" + Arrays.toString(image) + ", image1=" + image1 + ", roles=" + roles + "]";
	}

}

