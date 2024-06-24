package com.asm.service;

import java.util.List;

import com.asm.report.ReportCost;
import com.asm.report.ReportProduct;

public interface ReportService {
	List<ReportCost> reportCostInMonth(Integer month);
	List<ReportProduct> reportProductInMonth(Integer month);
}
