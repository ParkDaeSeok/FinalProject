package com.kh.laundry.washing.model.vo;

import java.util.List;

public class MultiCategory {
	
	private List<Lcategory> multiList;

	public MultiCategory() {
		super();
	}

	public MultiCategory(List<Lcategory> multiList) {
		super();
		this.multiList = multiList;
	}

	public List<Lcategory> getMultiList() {
		return multiList;
	}

	public void setMultiList(List<Lcategory> multiList) {
		this.multiList = multiList;
	}

	@Override
	public String toString() {
		return "MultiCategory [multiList=" + multiList + "]";
	}
	
	
	
}








