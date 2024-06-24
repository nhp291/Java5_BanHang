package com.asm.controller.rest;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.asm.bean.Brand;
import com.asm.service.BrandService;
import com.asm.service.UploadService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

@RestController
@CrossOrigin(origins = "*")
public class UploadRestController {
	@Autowired
	UploadService uService;

	@PostMapping("/admin/rest/upload/{folder}")
	public JsonNode upload(@PathVariable("folder") String folder, @PathParam("file") MultipartFile file) {
		File saveFile = uService.save(file, folder);
		ObjectMapper mapper = new ObjectMapper();
		ObjectNode node = mapper.createObjectNode();
		node.put("filename", saveFile.getName());
		node.put("size", saveFile.length());
		return node;
	}
	@PostMapping("/admin/rest/upload/product/{folder}")
	public List<JsonNode> upload(@PathVariable("folder") String folder, @PathParam("files") MultipartFile[] files) {
		List<JsonNode> listJson = new ArrayList<JsonNode>();
		List<File> listFile = uService.save(files, folder);
		for(File saveFile : listFile) {
			ObjectMapper mapper = new ObjectMapper();
			ObjectNode node = mapper.createObjectNode();
			node.put("filename", saveFile.getName());
			node.put("size", saveFile.length());
			listJson.add(node);
		}
		System.out.println(listJson);
		return listJson;
	}
	
}

