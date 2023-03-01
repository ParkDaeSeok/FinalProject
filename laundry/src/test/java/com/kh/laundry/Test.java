package com.kh.laundry;

import java.util.Calendar;
import java.util.Date;

import org.junit.experimental.theories.suppliers.TestedOn;


public class Test {

	@org.junit.Test
	public void test() {
		
		Calendar now = Calendar.getInstance();
		
		now.get(Calendar.YEAR);
		
		//now.get(Calendar.YEAR)+"년"+ now.get(Calendar.MONTH)+"월"+ now.get(Calendar.DAY_OF_MONTH)+"일"+now.get(Calendar.HOUR_OF_DAY)+
		
		System.out.println("YEAR: "+now.get(Calendar.YEAR));
		System.out.println("MONTH: "+now.get(Calendar.MONTH)+1);
		System.out.println("DAY: "+now.get(Calendar.DAY_OF_MONTH));
		System.out.println("HOUR: "+now.get(Calendar.HOUR_OF_DAY) +"시");
		System.out.println("HOUR: "+now.get(Calendar.MINUTE) +"분");
		System.out.println("HOUR: "+now.get(Calendar.SECOND) +"초");
		
		
	}

}
