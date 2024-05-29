package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CalendarMapper {
	
	public ArrayList<HashMap> gumaeCal(String userid,String ym);

}
