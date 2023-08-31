package demo_final.controller;

	import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import demo_final.dao.OwnerDao;
import demo_final.dao.ProductDao;
import demo_final.vo.OwnerVo;


	@Controller
	public class OwnerController {

		@Autowired
		HttpServletRequest request;

		@Autowired
		HttpSession session;


		OwnerDao ownerDao;
		
		ProductDao productDao;


		@Autowired
		public OwnerController(OwnerDao ownerDao) {
			this.ownerDao = ownerDao;
		}
		
		
		@RequestMapping("/owner/list.do")
		public String list(Model model){

		List<OwnerVo> list =ownerDao.selectList();

		model.addAttribute("list", list);

		return"owner/owner_list";
	}



	@RequestMapping("/owner/insert_form.do")
	public String insert_form(){

		return "owner/owner_insert_form";
	}

	//수정
	@RequestMapping("/owner/insert.do")
	public String insert(OwnerVo vo){

		//5.DB insert
			int res = ownerDao.insert(vo);
			if(res==0){}

			return "redirect:login_form.do";
	}



	@RequestMapping("/owner/login_form.do")
	public String login_form(){

		return "owner/owner_login_form";
	}
	

	@RequestMapping("/owner/login.do")
	public String login(String o_id,String o_pwd,
						@RequestParam(name="url",defaultValue ="" ) String url,
	RedirectAttributes ra){

		OwnerVo user = ownerDao.selectOneFromId(o_id);

		if(user==null) {
				
			ra.addAttribute("reason","fail_id");
			return "redirect:login_form.do";

		}
		
		if(user.getO_pwd().equals(o_pwd)==false) {
			
			ra.addAttribute("reason","fail_pwd");
			ra.addAttribute("o_id",o_id);
			return "redirect:login_form.do";
		}
		
		session.setAttribute("user", user);
		
	
		if(url.isEmpty()){
			return "redirect:../product/list.do";
		}

		return "redirect:" + url;
	}

	@RequestMapping("/owner/logout.do")
		public String logout() {

			session.removeAttribute("user");
			
			return "redirect:../product/list.do";
		}

		@RequestMapping(value="/owner/check_id.do",produces="application/json;charset=utf-8;")
		@ResponseBody
		public Map<String,Boolean> check_id(String o_id) {
			
			OwnerVo vo = ownerDao.selectOneFromId(o_id);
			
			boolean bResult;
			if(vo==null)
				bResult = true;
			else
				bResult = false;
			
			Map <String,Boolean>map = new HashMap<String,Boolean>();
			map.put("result", bResult);

			return map;
		}

		@RequestMapping("/owner/modify_form.do")
		public String modify_form(int o_idx,Model model) {

			OwnerVo vo = ownerDao.selectOneFromIdx(o_idx);
			
			//request binding
			model.addAttribute("vo", vo);
			
			return "owner/owner_modify_form";
		}

		@RequestMapping("/owner/modify.do")
		public String update(OwnerVo vo) {
	
			int res = ownerDao.update(vo);
			
			System.out.println("idx"+vo.getO_idx());

			if(res==0){}
					
			return "redirect:../product/list.do";
		}

		@RequestMapping("/owner/delete.do")
		public String delete(int o_idx) {

			//2.DB delete
			int res = ownerDao.delete(o_idx);
			if(res==0){}
			
			return "redirect:../admin/list.do";
		}



	


	






    

}
