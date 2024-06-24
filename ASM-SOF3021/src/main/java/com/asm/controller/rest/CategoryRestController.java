package com.asm.controller.rest;

import java.util.List;
import java.util.Optional;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.asm.bean.Brand;
import com.asm.bean.Category;
import com.asm.service.BrandService;
import com.asm.service.CategoryService;
import com.asm.service.UploadService;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/admin/rest/categories")
public class CategoryRestController {
	@Autowired
	CategoryService cService;
	@Autowired
	UploadService uService;

	@GetMapping("")
	public List<Category> getAllCategory() {
		return cService.findAll();
	}

	@GetMapping("/{id}")
	public ResponseEntity<Category> getCategory(@PathVariable("id") String id) {
		if (!cService.existsById(id)) {
			return ResponseEntity.notFound().build();
		} else {
			return ResponseEntity.ok(cService.findById(id));
		}
	}
	@GetMapping("/search")
	public List<Category> searchCategory(@RequestParam("kw") Optional<String> kw){
		String keyword = kw.orElse(null);		
		if(keyword != null) {
			return cService.findByName("%"+keyword+"%");
		}else {
			return this.getAllCategory();
		}
	}
	@PostMapping("")
	public ResponseEntity<Category> postCategory(@RequestBody Category cate){
		if(cService.existsById(cate.getId())) {
			return ResponseEntity.badRequest().build();
		}else {
			return ResponseEntity.ok(cService.save(cate));
		}
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<Category> putCategory(@PathVariable("id") String id, @RequestBody Category cate){
		if(!cService.existsById(id)) {
			return ResponseEntity.notFound().build();
		}else {
			return ResponseEntity.ok(cService.save(cate));
		}
	}
	@DeleteMapping("/{id}")
	public ResponseEntity<Void> deleteCategory(@PathVariable("id") String id){
		if(!cService.existsById(id)) {
			return ResponseEntity.notFound().build();
		}else {
			cService.deleteById(id);
			return ResponseEntity.ok().build();
		}
	}
	
}

