package com.asm.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.asm.report.ReportProduct;

@Repository
public interface ReportProductRepo extends JpaRepository<ReportProduct, Long>{
	@Query("SELECT NEW ReportProduct(p.id, p.name, COUNT(od.product.id)) "
			+ "FROM Product p, OrderDetail od "
			+ "WHERE p.id = od.product.id AND MONTH(p.createDate) = :month "
			+ "GROUP BY p.id, p.name ORDER BY COUNT(od.product.id) DESC")
	List<ReportProduct> reportProduct(@Param("month") Integer month);
}
