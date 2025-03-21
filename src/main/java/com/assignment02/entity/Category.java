package com.assignment02.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	@Column(name = "name")
	private String name;
	@Column(name = "number_choose")
	private int numberChoose;
	public Category() {

	}
	public Category(String name, int numberChoose) {
		this.name = name;
		this.numberChoose = numberChoose;
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
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the numberChoose
	 */
	public int getNumberChoose() {
		return numberChoose;
	}
	/**
	 * @param numberChoose the numberChoose to set
	 */
	public void setNumberChoose(int numberChoose) {
		this.numberChoose = numberChoose;
	}
	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", numberChoose=" + numberChoose + "]";
	}
	
	
}
