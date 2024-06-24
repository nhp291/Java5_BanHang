package com.asm.service.Impl;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.asm.service.UploadService;

@Service
public class UploadServiceImpl implements UploadService{
	@Autowired ServletContext app;
	
	private Path getPath(String folder, String filename) {
		File dir = Paths.get(app.getRealPath("/images"), folder).toFile();
		if(!dir.exists()) {
			dir.mkdirs();
		}
		return Paths.get(dir.getAbsolutePath(), filename);
	}
	
	@Override
	public File save(MultipartFile file, String folder) {
		String s = System.currentTimeMillis() + file.getOriginalFilename();
		String filename = Integer.toHexString(s.hashCode()) + s.substring(s.lastIndexOf("."));
		Path path = this.getPath(folder, filename);
		try {
			file.transferTo(path);
			System.out.println(path);
			return path.toFile();
		} catch (Exception e) {
			 throw new RuntimeException(e);
		}
	}

	@Override
	public void delete(String folder, String name) {
		Path path = this.getPath(folder, name);
		path.toFile().delete();
	}

	@Override
	public List<File> save(MultipartFile[] files, String folder) {
		List<File> listFile = new ArrayList<File>();
		for(MultipartFile file : files) {
			String s = System.currentTimeMillis() + file.getOriginalFilename();
			String filename = Integer.toHexString(s.hashCode()) + s.substring(s.lastIndexOf("."));
			Path path = this.getPath(folder, filename);
			try {
				file.transferTo(path);
				listFile.add(path.toFile());
				System.out.println(path);
			} catch (Exception e) {
				 throw new RuntimeException(e);
			}
		}
		return listFile;
	}

}
