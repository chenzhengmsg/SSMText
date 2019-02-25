package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Tuser;
import com.services.TuserService;

@Controller
public class TuserController {
	
	@Autowired
	private TuserService  tuserService;
	
	@RequestMapping("/hello")
	public ModelAndView hello(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("/save")
	public ModelAndView save(Tuser tuser){
		ModelAndView mv=new ModelAndView();
		tuserService.save(tuser);
		mv.setViewName("redirect:list");
		return mv;
	}
	
	@RequestMapping("/getLoginfo")
	public ModelAndView getLoginfo(Tuser tuser){
		ModelAndView mv=new ModelAndView();
		List<Tuser> list = tuserService.list(tuser);
		mv.addObject("list",list);
		mv.addObject("tuser",tuser);
		mv.setViewName("list");
		return mv;
	}
	
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(value="page",defaultValue="1")int page,@RequestParam(value="flag",required=false)String flag,@ModelAttribute("tuser")Tuser tuser){
		
		if(tuser==null){
			tuser=new Tuser();
		}
		tuser.setPagesize(10);
		int count=tuserService.getcount(tuser);
		if(flag!=null){
			if(flag.equals("first")){
				page=1;
			}
			if(flag.equals("last")){
				page=count;
			}
			if(flag.equals("down")){
				page=page+1;
				if(page>=count){
					page=count;
				}
			}
			if(flag.equals("up")){
				page=page-1;
				if(page<=1){
					page=1;
				}
			}
		}
		tuser.setBeginIndex((page-1)*3);
		ModelAndView mv=new ModelAndView();
		List<Tuser> list=tuserService.list(tuser);
		mv.addObject("list",list);
		mv.addObject("tuser",tuser);
		mv.addObject("page",page);
		mv.setViewName("list");
		return mv;
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(int id){
		ModelAndView mv=new ModelAndView();
		tuserService.delete(id);
		mv.setViewName("redirect:list");
		return mv;
	}
	
	@RequestMapping("/getbyid")
	public ModelAndView getbyid(int id){
		ModelAndView mv=new ModelAndView();
		Tuser tuser=tuserService.getbyid(id);
		mv.addObject("tuser",tuser);
		mv.setViewName("update");
		return mv;
	}
	
	@RequestMapping("/update")
	public ModelAndView update(Tuser tuser){
		ModelAndView mv=new ModelAndView();
		tuserService.update(tuser);
		mv.setViewName("redirect:list");
		return mv;
	}
}
