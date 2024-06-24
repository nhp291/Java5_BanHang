package com.asm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.bean.Category;
import com.asm.bean.Product;
import com.asm.bean.ProductCategory;
import com.asm.service.BrandService;
import com.asm.service.CategoryService;
import com.asm.service.ProductService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired BrandService bService;
	@Autowired CategoryService cService;
	@Autowired ProductService pService;
	
	@RequestMapping("/list")
	public String home(Model model,
			@RequestParam("kw") Optional<String> kw,
			@RequestParam("cid") Optional<String> cid,
			@RequestParam("bid") Optional<String> bid, 
			@RequestParam("p") Optional<Integer> p) {
			if(cid.isPresent()) {
				Page<Product> lstProduct = pService.findProductByCategory(cid, p);
				List<Map<String, Object>> products = pService.listProductSearch(lstProduct);
				model.addAttribute("page", lstProduct);
				model.addAttribute("products", products);
			}else if(bid.isPresent()) {
				Page<Product> lstProduct = pService.findProductByBrand(bid, p);
				List<Map<String, Object>> products = pService.listProductSearch(lstProduct);
				model.addAttribute("page", lstProduct);
				model.addAttribute("products", products);
			}else {
				Page<Product> lstProduct = pService.searchProductByName(kw, p);
				List<Map<String, Object>> products = pService.listProductSearch(lstProduct);
				model.addAttribute("page", lstProduct);
				model.addAttribute("products", products);
			}
		return "product/list";
	}
	@GetMapping("/list/brand")
	public String filterByListBrand(Model model,
			@RequestParam("bid") List<String> bid,
			@RequestParam("p") Optional<Integer> p) {
		Page<Product> lstProduct = pService.findProductByListBrand(bid, p);
		List<Map<String, Object>> products = pService.listProductSearch(lstProduct);
		model.addAttribute("page", lstProduct);
		model.addAttribute("products", products);
		return "product/list";
	}
	@GetMapping("/list/price/{price}")
	public String filterByPrice(Model model,
			@PathVariable("price") String price,
			@RequestParam("p") Optional<Integer> p) {
		if(price.equalsIgnoreCase("under5000")) {
			Page<Product> lstProduct = pService.findProductLessThanPrice(5000.0, p);
			List<Map<String, Object>> products = pService.listProductSearch(lstProduct);
			model.addAttribute("page",lstProduct);
			model.addAttribute("products", products);
		}
		else if(price.equalsIgnoreCase("5000-10000")) {
			Page<Product> lstProduct = pService.findProductBetweenPrice(5000.0, 10000.0, p);
			List<Map<String, Object>> products = pService.listProductSearch(lstProduct);
			model.addAttribute("page",lstProduct);
			model.addAttribute("products", products);
		}
		else if(price.equalsIgnoreCase("10000-20000")) {
			Page<Product> lstProduct = pService.findProductBetweenPrice(10000.0, 20000.0, p);
			List<Map<String, Object>> products = pService.listProductSearch(lstProduct);
			model.addAttribute("page",lstProduct);
			model.addAttribute("products", products);
		}
		else if(price.equalsIgnoreCase("over20000")) {
			Page<Product> lstProduct = pService.findByPriceGreaterThanEqual(20000.0, p);
			List<Map<String, Object>> products = pService.listProductSearch(lstProduct);
			model.addAttribute("page",lstProduct);
			model.addAttribute("products", products);
		}
		return "product/list";
	}
	@RequestMapping("/detail/{id}")
	public String detail(Model model,
			@PathVariable("id") Long id) {
		Map<String, Object> map = pService.ProductDetail(id);
		model.addAttribute("product", map);
		
		Product product = (Product) map.get("product");
		List<ProductCategory> productCates = product.getProductCategories();
		List<String> categories = new ArrayList<String>();
		for (ProductCategory productCate : productCates){
			categories.add(productCate.getCategory().getId());
		}
		Optional<Integer> p = Optional.of(0);
		Page<Product> pageProduct = pService.findProductByListCategory(categories, p);
		List<Map<String, Object>> products = pService.listProductSearch(pageProduct);
		model.addAttribute("productsRcm", products);
		return "product/product-detail";
	}
}
