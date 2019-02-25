package com.services;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bean.Tuser;
import com.mapper.TuserMapper;

@Service
public class TuserService {
	
	
	private TuserMapper tuserMapper;
	
	
	public TuserMapper getTuserMapper() {
		return tuserMapper;
	}
	@Resource
	public void setTuserMapper(TuserMapper tuserMapper) {
		this.tuserMapper = tuserMapper;
	}

	public void save(Tuser tuser){
		tuserMapper.save(tuser);
	}
	
	public List<Tuser> list(Tuser tuser){
		List<Tuser> list=tuserMapper.list(tuser);
		return list;
	}
	
	public void delete(int id){
		tuserMapper.delete(id);
	}
	
	public Tuser getbyid(int id){
		Tuser tuser=tuserMapper.getbyid(id);
		return tuser;
	}
	
	public void update(Tuser tuser){
		tuserMapper.update(tuser);
	}
	
	public int getcount(Tuser tuser){
		int count=tuserMapper.getcount(tuser);
		if(count%tuser.getPagesize()==0){
			return count/tuser.getPagesize();
		}else{
			return (count/tuser.getPagesize())+1;
		}
	}
}
