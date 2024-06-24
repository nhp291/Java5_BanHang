package com.asm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.bean.Account;
import com.asm.bean.Role;
import com.asm.bean.RoleDetail;
import com.asm.service.AccountService;
import com.asm.service.BrandService;
import com.asm.service.CategoryService;
import com.asm.service.MailerService;
import com.asm.service.ProductService;
import com.asm.service.SessionService;

@Controller
public class HomeController {
	@Autowired
	BrandService bService;
	@Autowired
	CategoryService cService;
	@Autowired
	ProductService pService;
	@Autowired
	SessionService session;
	@Autowired
	AccountService aService;
	@Autowired 
	MailerService mailer;

	@RequestMapping("/admin")
	public String admin() {
		return "admin/index";
	}

	@RequestMapping("/")
	public String home(Model model) {
		// load ds product xep theo ngay tao
		model.addAttribute("db", pService.findProductByCreateDateDESC());
		return "home/index";
	}

	@GetMapping("/brand/list")
	public String brandList(Model model) {
		return "brand/list";
	}

	@GetMapping("/register")
	public String register(	@ModelAttribute Account account) {
		return "register";
	}
	@PostMapping("/register")
	public String signup(Model model,
			@ModelAttribute Account account) {
		if(aService.existsById(account.getUsername())) {
			model.addAttribute("error", "Đã tồn tại username "+account.getUsername());
			return "register";
		}else {
			account.setActivated(true);
			
			account.setPhoto("logo.jpg");
			
			Role r = new Role();
			r.setRole("user");
			RoleDetail rd = new RoleDetail();
			rd.setAccount(account);
			rd.setRole(r);
			
			aService.save(account);
			aService.saveRoleDetail(rd);
			return "redirect:/register/success";
		}
	}
	@RequestMapping("/register/success")
	public String registerSuccess(Model model) {
		model.addAttribute("message", "Đăng ký thành công");
		return "login";
	}

	@GetMapping("/login")
	public String formLogin(Model model, @RequestParam(value = "message", required = false) String message) {
		model.addAttribute("message", message);
		return "login";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("username") String username,
			@RequestParam("password") String password, 
			Model model) {
		try {
			Account account = aService.findByUsername(username);
			if(!account.getPassword().equals(password)) {
				model.addAttribute("message", "Invalid password");
			}else {
				String uri = session.get("security-uri");
//				if(uri != null) {
//					return "redirect:"+uri;
//				}
//				else {
					session.set("user", account);
					if(this.checkAdmin(account)) {
						session.set("userAdmin", "admin");
					}
					model.addAttribute("message", "Login success");
//				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("message", "Invalid username");
		}
		return "login";
	}

	public Boolean checkAdmin(Account account) {
		for(RoleDetail roleDetail : account.getRoleDetails()) {
			if(roleDetail.getRole().getRole().equals("staff") || roleDetail.getRole().getRole().equals("director")) {
				return true;
			}
		}
		return false;
	}
	@RequestMapping("/logout")
	public String logoutSuccess(Model model) {
		session.remove("user");
		session.remove("userAdmin");
		session.remove("security-uri");
		session.remove("uri");
		model.addAttribute("message", "Đăng xuất thành công");
		return "login";
	}
	
	@GetMapping("forgot-password")
	public String forgot() {
		return "forgot";
	}
	
	@PostMapping("forgot-password")
	public String forgot(@RequestParam("username") String username, Model model) {
		try {
			Account account = aService.findByUsername(username);
			String to = account.getEmail();
			String email = to.substring(0, 2);
			
			double randomDouble = Math.random();
            randomDouble = randomDouble * 1000000 + 1;
            int randomInt = (int) randomDouble;
			
			String subject = "Lấy lại mật khẩu";
			String body = "Mật khẩu của bạn là:"+randomInt;
			mailer.send(to, subject, body);
			
			account.setPassword(String.valueOf(randomInt));
			aService.save(account);
			
			model.addAttribute("message", "Mật khẩu mới đã được gửi đến mail "+email+"***");
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("message", "Invalid Username");
		}
		return "forgot";
	}
}
