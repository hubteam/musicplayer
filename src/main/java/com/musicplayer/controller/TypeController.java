package com.musicplayer.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.musicplayer.entity.SongType;
import com.musicplayer.service.TypeService;

@Controller
@RequestMapping(value="/type")
public class TypeController {

	@Autowired
	private TypeService typeService;
	
	@RequestMapping(value="/typeMana")
	public ModelAndView typeMana(){
		ModelAndView mv = new ModelAndView();
		List<SongType> list = typeService.showType();
		
		mv.addObject("type",list);
		mv.setViewName("/adminPage/type.jsp");
		return mv;
	}
	
	@RequestMapping(value="/showAllType")
	public ModelAndView showAllType(){
		ModelAndView mv = new ModelAndView();
        List<SongType> list = typeService.showType();
		
		mv.addObject("type",list);
		mv.setViewName("/userPage/genres.jsp");
		return mv;
	}
	
	@RequestMapping(value="/typeShowOne")
	public @ResponseBody SongType typeShowOne(String fileName){
		int typeId = Integer.parseInt(fileName);
	//	System.out.println(typeId);
		List<SongType> list = typeService.showOneType(typeId);
		SongType songType = list.get(0);
	//	System.out.println(songType.getSongTypeId());
		//System.out.println(songType.getSongTypeName());
		return songType;
	}
	
	@RequestMapping(value="/typeDel")
	public String typeDel(@RequestParam(value = "ti") Integer id){
		typeService.delType(id);
		return "redirect:/type/typeMana";
	}
	
	@RequestMapping(value="/typeChange")
	public String typeChange(@RequestParam(value = "ti") Integer ti,@RequestParam(value = "tn") String tn) throws UnsupportedEncodingException{
		System.out.println(ti+" "+tn);

		tn = new String(tn.getBytes("ISO-8859-1"),"UTF-8");
		SongType songType = new SongType();
		songType.setSongTypeId(ti);
		songType.setSongTypeName(tn);
		typeService.chaType(songType);
		return "redirect:/type/typeMana";
	}
	@RequestMapping(value="/typeAdd")
	public String typeAdd(@RequestParam(value = "mytype") String type) throws UnsupportedEncodingException{
		System.out.println(type);
		type=new String(type.getBytes("ISO-8859-1"),"UTF-8");
		System.out.println(type);
		//typeService.chaType(id);
		typeService.addType(type);
		return "redirect:/type/typeMana";
	}
}
