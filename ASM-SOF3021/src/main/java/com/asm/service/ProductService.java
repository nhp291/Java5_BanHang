package com.asm.service;

import java.awt.print.Pageable;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;

import com.asm.bean.Product;
import com.asm.bean.ProductCategory;
import com.fasterxml.jackson.databind.JsonNode;

public interface ProductService {

	List<Product> findAll();

	boolean existsById(Long id);

	Product findById(Long id);

	List<Product> findByName(String string);

	Product save(Product product);

	void deleteById(Long id);

	List<ProductCategory> findProductCategory();
	
	List<ProductCategory> findByProductId(Long id);

	Product save(JsonNode data);

	void deleteProductCateById(Long id);

	ProductCategory saveProductCates(ProductCategory productCates);

	List<Map<String, Object>> findProductByCreateDateDESC();
	
	Page<Product> searchProductByName(Optional<String> kw, Optional<Integer> p);

	Page<Product> findProductByBrand(Optional<String> bid, Optional<Integer> p);

	Page<Product> findProductByCategory(Optional<String> cid, Optional<Integer> p);
	
	Page<Product> findProductByListBrand(List<String> bid, Optional<Integer> p);
	
	Page<Product> findProductLessThanPrice(Double price, Optional<Integer> p);
	
	Page<Product> findProductBetweenPrice(Double min, Double max, Optional<Integer> p);
	
	Page<Product> findByPriceGreaterThanEqual(Double price, Optional<Integer> p);
	
	List<Map<String, Object>> listProductSearch(Page<Product> lstProduct);

	Map<String, Object> ProductDetail(Long id);
	
	Page<Product> findProductByListCategory(List<String> cid, Optional<Integer> p);
	
	
//	Page<Product> findPageProduct(Optional<String> kw, Optional<String> cid, Optional<String> brandid, Optional<Integer> p);
//	
//	List<Map<String, Object>> findProductByKeywordAndPage(Optional<String> kw, Optional<String> cid, Optional<String> brandid, Optional<Integer> p);

//	List<Map<String, Object>> findByCategoryId(String id, Optional<Integer> p);
}
