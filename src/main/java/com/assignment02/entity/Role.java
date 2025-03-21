package com.assignment02.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "role")
public class Role {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	@Column(name = "role_name")
	private String roleName;
//	@OneToMany(mappedBy = "role", cascade = CascadeType.ALL)
//	private List<User> users;
	@ManyToMany(mappedBy = "roles", cascade = {CascadeType.PERSIST, CascadeType.MERGE, 
											   CascadeType.DETACH, CascadeType.REFRESH}, fetch = FetchType.EAGER)
	private Set<User> users = new HashSet<>();

	public Role() {
	}

	public Role(String roleName) {
		this.roleName = roleName;
//		this.users = users;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the roleName
	 */
	public String getRoleName() {
		return roleName;
	}

	/**
	 * @param roleName the roleName to set
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

//	/**
//	 * @return the users
//	 */
//	public List<User> getUsers() {
//		return users;
//	}
//	/**
//	 * @param users the users to set
//	 */
//	public void setUsers(List<User> users) {
//		this.users = users;
//	}
//	@Override
//	public String toString() {
//		return "Role [id=" + id + ", roleName=" + roleName + ", users=" + users + "]";
//	}
	@Override
	public String toString() {
		return "Role [id=" + id + ", roleName=" + roleName + "]";
	}

}
