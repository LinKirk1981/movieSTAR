package com.iii.movie.admin.model;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Role {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long mempk;
	
	@Column
	private String name;

	@ManyToMany(mappedBy = "roles")
	private Collection<IMovieMember> imoviemembers;

	@ManyToMany(mappedBy = "roles")
	private Collection<Functiontable> functions;

	public Role() {
		super();
	}

	public Role(final String name) {
		super();
		this.name = name;
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

	public void setName(final String name) {
		this.name = name;
	}

	public Collection<IMovieMember> getImoviemembers() {
		return imoviemembers;
	}

	public void setImoviemembers(final Collection<IMovieMember> imoviemembers) {
		this.imoviemembers = imoviemembers;
	}

	public Collection<Functiontable> getFunctions() {
		return functions;
	}

	public void setFunctions(final Collection<Functiontable> functions) {
		this.functions = functions;
	}

	@Override
	public String toString() {
		final StringBuilder builder = new StringBuilder();
		builder.append("Role [name=").append(name).append("]").append("[mempk=").append(mempk).append("]");
		return builder.toString();
	}

}