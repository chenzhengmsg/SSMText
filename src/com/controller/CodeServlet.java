//package com.controller;
//
//import java.awt.image.RenderedImage;
//import java.util.Map;
//
//import javax.imageio.ImageIO;
//import javax.servlet.ServletOutputStream;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//@WebServlet("/getCode")
//@SuppressWarnings("serial")
//public class CodeServlet extends HttpServlet {
//
//	protected void doGet(HttpServletRequest req,HttpServletResponse resp) {
//		Map<String,Object> codeMap = YanzhengMaTest.generateCodeAndPic();
//		HttpSession session = req.getSession();
//		session.setAttribute("code", codeMap.get("code").toString());
//		
//		resp.setHeader("Pragma", "no-cache");
//		resp.setHeader("Cache-Control", "no-cache");
//		resp.setDateHeader("Expires", -1);
//		
//		resp.setContentType("image/jpeg");
//		
//		ServletOutputStream sos;
//		try {
//			sos = resp.getOutputStream();
//			ImageIO.write((RenderedImage) codeMap.get("codePic"), "jpeg", sos);
//			sos.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//	}
//}
