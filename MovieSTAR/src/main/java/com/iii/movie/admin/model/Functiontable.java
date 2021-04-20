package com.iii.movie.admin.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;


import org.springframework.http.HttpMethod;

@Entity
@Table(name="functiontable")
public class Functiontable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long mempk;

	@Column
	private String name;

	@ManyToMany
	@JoinTable(name = "functiontables_roles", 
		joinColumns = @JoinColumn(name = "functiontable_mempk", referencedColumnName = "mempk"), 
		inverseJoinColumns = @JoinColumn(name = "role_mempk", referencedColumnName = "mempk"))
	private Collection<Role> roles;

	@Column
	private String httpmethod;

	@Column
	private String url;

	public Functiontable() {
		super();
	}

	public Functiontable(final String name) {
		super();
		this.name = name;
	}

	public Functiontable(String name, String httpmethod, String url) {
		super();
		this.name = name;
		this.httpmethod = httpmethod;
		this.url = url;
	}
	
	public Long getMempk() {
		return mempk;
	}

	public void setMempk(final Long mempk) {
		this.mempk = mempk;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Collection<Role> getRoles() {
		return roles;
	}

	public void setRoles(Collection<Role> roles) {
		this.roles = roles;
	}

	public String getHttpMethod() {
		return httpmethod;
	}

	public void setHttpMethod(String httpmethod) {
		this.httpmethod = httpmethod;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	// will be called in spring-security sample
	public HttpMethod getHttpMethodEnum() {
		return HttpMethod.resolve(this.httpmethod);
	}
	
	// will be called in spring-security sample
	public String[] getRoleStrings() {
		
		if (roles == null || roles.size() == 0) {
			return new String[0];
		}
		
		List<String> roleNameList = new ArrayList<>();
		String[] roleNameStrings = new String[roles.size()];
		Iterator<Role> i = roles.iterator();
		
		while (i.hasNext()) {
			roleNameList.add(i.next().getName());
		}
		
		roleNameList.toArray(roleNameStrings);
		return roleNameStrings;
	}

	@Override
	public String toString() {
		return "Functiontable [mempk=" + mempk + ", name=" + name + ", roles=" + roles.size() + ", httpmethod=" + httpmethod
				+ ", url=" + url + "]";
	}

}
