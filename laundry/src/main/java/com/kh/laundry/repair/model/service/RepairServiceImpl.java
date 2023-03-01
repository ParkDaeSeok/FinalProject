package com.kh.laundry.repair.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.laundry.repair.model.dao.RepairDao;
import com.kh.laundry.repair.model.vo.Repair;

@Service
public class RepairServiceImpl implements RepairService{

	@Autowired
	private RepairDao repairDao;

	@Override
	public int repairCount() {
		
		int resultRepair = repairDao.repairCount();
		
		return resultRepair;
	}

	
}
