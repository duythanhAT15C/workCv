package com.assignment02.dto;

public class CategoryDTO {
	private int id;
	private String name;
	private int numberChoose;
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
		return "CategoryDTO [id=" + id + ", name=" + name + ", numberChoose=" + numberChoose + "]";
	}
	
}
