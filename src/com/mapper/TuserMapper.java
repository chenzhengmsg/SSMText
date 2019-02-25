package com.mapper;

import java.util.List;

import com.bean.Tuser;

public interface TuserMapper {

	public void save(Tuser tuser);
	
	public void delete(int id);
	
	public void update(Tuser tuser);
	
	public Tuser getbyid(int id);
	
	public List<Tuser> list(Tuser tuser);
	
	public int getcount(Tuser tuser);
}
