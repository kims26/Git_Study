package demo_final.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import demo_final.dao.CategoryDao;
import demo_final.vo.CategoryVo;

@Controller
public class CategoryController {



    CategoryDao categoryDao;
    
     @RequestMapping("/category/list.do")
		public String list(Model model){

		List<CategoryVo> list =categoryDao.selectList();

		model.addAttribute("list", list);

		return"category/category_list";
	}
}
