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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import demo_final.dao.AdminDao;
import demo_final.dao.MemberDao;
import demo_final.dao.OwnerDao;
import demo_final.vo.AdminVo;
import demo_final.vo.MemberVo;
import demo_final.vo.OwnerVo;


@Controller
public class AdminController {

	

    @Autowired
    HttpServletRequest request;

    @Autowired
	HttpSession session;


	AdminDao adminDao;
	
	@Autowired
	MemberDao memberDao;

	@Autowired
	OwnerDao ownerDao;


	public AdminController(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	@RequestMapping("/admin")
		public String main() {
		return "redirect:admin/login_form.do";
	}

	@RequestMapping("/admin/list.do")
	public String list(Model model) {

		List<AdminVo> list = adminDao.selectList();
		List<MemberVo> mem_list = memberDao.selectList();
		List<OwnerVo> o_list = ownerDao.selectList();
		
		// System.out.println(mem_list);
		// System.out.println(list);
		//request binding
		model.addAttribute("list", list);
		model.addAttribute("mem_list", mem_list);
		model.addAttribute("o_list", o_list);
		
		return "admin/admin_list";
	}
	
	// @RequestMapping("/admin/owner_list.do")
	// public String Ownerlist(int o_idx, Model model) {

		
	// 	List<OwnerVo> list = ownerDao.selectOwnerList(o_idx);
		
	// 	//request binding
	// 	model.addAttribute("list", list);
		
	// 	return "admin/admin_list";
	// }

	@RequestMapping("/admin/member_list.do")
	public String Memberlist(Model model) {

		
		List<MemberVo> list = memberDao.selectList();
		
		//request binding
		model.addAttribute("list", list);
		
		return "admin/admin_list";
	}

	@RequestMapping("/admin/insert_form.do")
	public String insert_form() {

		return "admin/admin_insert_form";
	}
	

	@RequestMapping("/admin/insert.do")
	public String insert(AdminVo vo) {

		
		String admin_ip		=	request.getRemoteAddr();
		vo.setAdmin_ip(admin_ip);
		
		//5.DB insert
		int res =	adminDao.insert(vo);
		if(res==0){}
		
		
		return "redirect:login_form.do";
	}
	
	@RequestMapping("/admin/login_form.do")
	public String login_form() {

		return "admin/admin_login_form";
	}
	
	@RequestMapping("/admin/login.do")
	public String login(String admin_id,String admin_pwd , RedirectAttributes ra) {

		
		AdminVo user = adminDao.selectOneFromId(admin_id);
		
		if(user==null) {
			
			ra.addAttribute("reason","fail_id");
			return "redirect:insert.do";

		}
		
		if(user.getAdmin_pwd().equals(admin_pwd)==false) {
			
			ra.addAttribute("reason","fail_id");
			ra.addAttribute("admin_id","admin_id");
			return "redirect:admin_login_form.do";
		}
		
		session.setAttribute("user", user);
		
		return "redirect:list.do";
	}
	
	@RequestMapping("/admin/logout.do")
	public String logout() {

		session.removeAttribute("user");
		
		return "redirect:../admin/list.do";
	}
	
	@RequestMapping(value="/admin/check_id.do",produces="application/json;charset=utf-8;")
	@ResponseBody
	public Map<String,Boolean> check_id(String admin_id) {
		
		
		AdminVo  vo = adminDao.selectOneFromId(admin_id);
		
		boolean bResult;
		if(vo==null)
			bResult = true;
		else
			bResult = false;
		
		Map <String,Boolean>map = new HashMap<String,Boolean>();
		map.put("result", bResult);

		return map;
	}
	
	
	@RequestMapping("/admin/admin_modify_form.do")
	public String modify_form(int admin_idx,Model model) {

		
		AdminVo vo = adminDao.selectOneFromIdx(admin_idx);
		
		//request binding
		
		model.addAttribute("vo", vo);
		
		return "admin/admin_modify_form";
	}
	
	@RequestMapping("/admin/admin_modify.do")
	public String modify(AdminVo vo) {

		//3.ip
		String admin_ip		= request.getRemoteAddr();
		vo.setAdmin_ip(admin_ip);
		
		//5.DB update
		int res = adminDao.update(vo);
		
		if(res==0){}
				
		return "redirect:list.do";
	}
	@RequestMapping("/admin/delete.do")
	public String delete(int admin_idx) {

        //2.DB delete
		int res = adminDao.delete(admin_idx);
		if(res==0){}
		
		return "redirect:list.do";
	}


}