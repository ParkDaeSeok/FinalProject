package com.kh.laundry.repair.model.vo;

import java.util.List;

public class MultiRepair {
	
	private List<Repair> multiList;

	public MultiRepair() {
		super();
	}

	public MultiRepair(List<Repair> multiList) {
		super();
		this.multiList = multiList;
	}

	public List<Repair> getMultiList() {
		return multiList;
	}
	
	public void setMultiList(List<Repair> multiList) {
		this.multiList = multiList;
	}

	@Override
	public String toString() {
		return "MultiRepair [multiList=" + multiList + "]";
	}
	
	
	
}
