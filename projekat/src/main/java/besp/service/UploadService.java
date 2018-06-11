package besp.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UploadService {
	public static final Path rootLocation = Paths.get("src/main/resources/static/assets/");
	public String store(MultipartFile file) {
		String fileName = null;
		try {
			fileName = file.getOriginalFilename();
			if(!(fileName.endsWith(".JKS")|| fileName.endsWith(".jks"))) {
				return fileName;
			}
			Path filePath = rootLocation.resolve(fileName);
            Resource resource = new UrlResource(filePath.toUri());
            if(resource.exists()) {
            	fileName = fileName.substring(0, fileName.length() - 4);
            		fileName = fileName + "_"  + System.currentTimeMillis() + ".jks";
            }            
            Files.copy(file.getInputStream(), rootLocation.resolve(fileName));
        } catch (Exception e) {
        	throw new RuntimeException();
        }
		return fileName;
	}
}
