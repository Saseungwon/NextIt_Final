package com.nextit.common.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.nextit.attach.vo.AttachVO;
import com.nextit.profile.vo.ProfileVO;

@Component
public class ProfileUtils {
	@Value("#{app['file.upload.path']}")
	private String uploadPath;
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH24mm");
	
	private Logger logger=LoggerFactory.getLogger(getClass());

	public ProfileVO getProfileByMultipart(MultipartFile multipart, String category, String parent) throws IOException {
		if (!multipart.isEmpty()) {
			String fileName = sdf.format(new Date()) + parent;
			ProfileVO vo = new ProfileVO();
			// IE 조심
			vo.setPfCate(category);
			vo.setPfParent(parent);
			vo.setPfPath(File.separatorChar + "profile" + File.separatorChar + category + File.separatorChar + fileName);
			String filePath = uploadPath + File.separatorChar + "profile" + File.separatorChar + category + File.separatorChar + fileName;
			logger.debug("filePath = {}, fileName = {}", filePath, fileName);
			FileUtils.copyInputStreamToFile(multipart.getInputStream(), new File(filePath));
			return vo;
		} else {
			return null;
		}
	}
}
