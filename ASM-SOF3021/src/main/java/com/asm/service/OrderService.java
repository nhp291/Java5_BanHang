package com.asm.service;

import java.util.List;
import java.util.Map;

import com.asm.bean.Order;
import com.asm.report.ReportCategory;
import com.fasterxml.jackson.databind.JsonNode;

public interface OrderService {

	Order create(JsonNode order);

	Order findById(Long id);

	List<Order> findByUsername(String username);

//	Double sumCostInMonth(Integer month);

	List<Order> findOrderInMonth(Integer month);

	Integer countOrderInMonth(Integer month);
	
}
