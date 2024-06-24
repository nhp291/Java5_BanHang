package com.asm.service.Impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.asm.bean.Category;
import com.asm.bean.Product;
import com.asm.bean.ProductCategory;
import com.asm.dao.ProductCategoryRepo;
import com.asm.dao.ProductRepo;
import com.asm.service.ProductService;
import com.asm.service.SessionService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductRepo pRepo;
	@Autowired
	ProductCategoryRepo pcRepo;
	@Autowired
	SessionService session;

	@Override
	public List<Product> findAll() {
		return pRepo.findAll();
	}

	@Override
	public boolean existsById(Long id) {
		return pRepo.existsById(id);
	}

	@Override
	public Product findById(Long id) {
		return pRepo.findById(id).get();
	}

	@Override
	public List<Product> findByName(String name) {
		return pRepo.findByName(name);
	}

	@Override
	public Product save(Product product) {
		return pRepo.save(product);
	}

	@Override
	public void deleteById(Long id) {
		pRepo.deleteById(id);
	}

	@Override
	public List<ProductCategory> findProductCategory() {
		return pcRepo.findAll();
	}

	@Override
	public List<ProductCategory> findByProductId(Long id) {
		return pcRepo.findByProductId(id);
	}

	@Override
	public Product save(JsonNode data) {
		ObjectMapper mapper = new ObjectMapper();
		Product product = mapper.convertValue(data.get("p"), Product.class);

		pRepo.save(product);

		return pRepo.save(product);
	}

	@Override
	public void deleteProductCateById(Long id) {
		pcRepo.deleteById(id);
	}

	@Override
	public ProductCategory saveProductCates(ProductCategory productCates) {
		return pcRepo.save(productCates);
	}

	@Override
	public List<Map<String, Object>> findProductByCreateDateDESC() {

		// load ds san pham xep theo ngay tao
		Sort sort = Sort.by(Direction.DESC, "createDate");
		List<Product> data = pRepo.findAll(sort);
		// convert json hinh anh sang mang
		TypeReference<List<String>> typeString = new TypeReference<List<String>>() {
		};
		ObjectMapper mapper = new ObjectMapper();
		List<String> images = new ArrayList<String>();
		// list du lieu tai len ui
		List<Map<String, Object>> db = new ArrayList<Map<String, Object>>();
		try {

			for (Product p : data) {
				Map<String, Object> map = new HashMap<String, Object>();
				p.getId();
				p.getName();
				p.getPrice();
				images = mapper.readValue(p.getImages(), typeString);
				map.put("product", p);
				map.put("images", images);
				db.add(map);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return db;
	}

//	@Override
//	public Page<Product> findPageProduct(Optional<String> kw, Optional<String> cid, Optional<String> bid, Optional<Integer> p) {
//		String kwords = kw.orElse(session.getValue("keywords", ""));
//		session.set("keywords", kwords);
//		Pageable pageable = PageRequest.of(p.orElse(0), 12);
//		if (cid.isPresent()) {
//			String categoryId = cid.orElse(null);
//			Page<Product> page = pRepo.findByCategory(categoryId, pageable);
//			return page;
//		}
//		else if(bid.isPresent()) {
//			String brandId = bid.orElse(null);
//			Page<Product> page = pRepo.findByBrand(brandId, pageable);
//			return page;
//		}
//		else {
//			Page<Product> page = pRepo.findByKeyword("%" + kwords + "%", pageable);
//			return page;
//		}
//	}
	
	@Override
	public Page<Product> searchProductByName(Optional<String> kw, Optional<Integer> p){
		String keyword = kw.orElse(session.getValue("keyword", ""));
		session.set("keyword", keyword);
		Pageable pageable = PageRequest.of(p.orElse(0), 12);
		return pRepo.findByKeyword("%"+keyword+"%", pageable);
	}
	
	@Override 
	public Page<Product> findProductByBrand(Optional<String> bid, Optional<Integer> p){
		String brandId = bid.orElse(session.getValue("brandId", ""));
		session.set("brandId", brandId);
		Pageable pageable = PageRequest.of(p.orElse(0), 12);
		return pRepo.findByBrand(brandId, pageable);
	}
	
	@Override 
	public Page<Product> findProductByCategory(Optional<String> cid, Optional<Integer> p){
		String categoryId = cid.orElse(session.getValue("categoryId", ""));
		session.set("categoryId", categoryId);
		Pageable pageable = PageRequest.of(p.orElse(0), 12);
		return pRepo.findByCategory(categoryId, pageable);
	}
	
	@Override
	public Page<Product> findProductByListBrand(List<String> bid, Optional<Integer> p){
		session.set("lstBrandId", bid);
		Pageable pageable = PageRequest.of(p.orElse(0), 12);
		return pRepo.findByListBrand(bid, pageable);
	}
	@Override
	public Page<Product> findProductLessThanPrice(Double price, Optional<Integer> p){
		session.set("price", price);
		Pageable pageable = PageRequest.of(p.orElse(0), 12);
		return pRepo.findByPriceLessThanEqual(price, pageable);
	}
	
	@Override
	public Page<Product> findProductBetweenPrice(Double min, Double max, Optional<Integer> p){
		session.set("minPrice", min);
		session.set("maxPrice", max);
		Pageable pageable = PageRequest.of(p.orElse(0), 12);
		return pRepo.findByPriceBetween(min, max, pageable);
	}
	
	@Override
	public Page<Product> findByPriceGreaterThanEqual(Double price, Optional<Integer> p){
		session.set("price", price);
		Pageable pageable = PageRequest.of(p.orElse(0), 12);
		return pRepo.findByPriceGreaterThanEqual(price, pageable);
	}
	@Override
	public List<Map<String, Object>> listProductSearch(Page<Product> lstProduct){
		List<Product> products = lstProduct.getContent();
		
		TypeReference<List<String>> typeString = new TypeReference<List<String>>() {};
		ObjectMapper mapper = new ObjectMapper();
		List<String> images = new ArrayList<String>();
		List<Map<String, Object>> db = new ArrayList<Map<String, Object>>();
		try {
			for (Product product : products) {
				Map<String, Object> map = new HashMap<String, Object>();
				product.getId();
				product.getName();
				product.getPrice();
				images = mapper.readValue(product.getImages(), typeString);
				map.put("product", product);
				map.put("images", images);
				db.add(map);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return db;
	}

	@Override
	public Map<String, Object> ProductDetail(Long id) {
		Product product = pRepo.findById(id).get();
		ObjectMapper mapper = new ObjectMapper();
		TypeReference<List<String>> type = new TypeReference<List<String>>() {
		};
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<String> images = mapper.readValue(product.getImages(), type);
			map.put("product", product);
			map.put("images", images);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return map;
	}
	public Page<Product> findProductByListCategory(List<String> cid,  Optional<Integer> p){
		Pageable page = PageRequest.of(p.orElse(0), 6);
		return pRepo.findByListCategory(cid, page);
	}
	
//	@Override
//	public List<Map<String, Object>> findProductByKeywordAndPage(Optional<String> kw, Optional<String> cid, Optional<String> bid,
//			Optional<Integer> p) {
//		List<Product> products = this.findPageProduct(kw, cid, bid, p).getContent();
//
//		TypeReference<List<String>> typeString = new TypeReference<List<String>>() {
//		};
//		ObjectMapper mapper = new ObjectMapper();
//		List<String> images = new ArrayList<String>();
//		List<Map<String, Object>> db = new ArrayList<Map<String, Object>>();
//		try {
//			for (Product product : products) {
//				Map<String, Object> map = new HashMap<String, Object>();
//				product.getId();
//				product.getName();
//				product.getPrice();
//				images = mapper.readValue(product.getImages(), typeString);
//				map.put("product", product);
//				map.put("images", images);
//				db.add(map);
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		return db;
//	}

//	@Override
//	public List<Map<String, Object>> findByCategoryId(String id, Optional<Integer> p) {
//		
//		return null;
//	}

}
