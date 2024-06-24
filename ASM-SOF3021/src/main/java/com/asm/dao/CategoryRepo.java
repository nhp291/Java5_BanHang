package com.asm.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.asm.bean.Category;


@Repository
public interface CategoryRepo extends JpaRepository<Category, String>{
	@Query("SELECT c FROM Category c WHERE c.name LIKE :name")
	List<Category> findByName(@Param("name") String name);
}
