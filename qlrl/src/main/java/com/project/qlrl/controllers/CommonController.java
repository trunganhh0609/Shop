package com.project.qlrl.controllers;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

@RestController
@RequestMapping("view")
public class CommonController {

    @GetMapping("/view/img-view")
    public byte[] getImg(@RequestParam Map param) throws IOException {
        String path = "D:\\Img/" +param.get("path").toString();
        byte[] dataImg = IOUtils.toByteArray( path);
        return dataImg;
    }

    @GetMapping("/img-view/{fileName}")
    public ResponseEntity<byte[]> getImg(@PathVariable("fileName")String fileName) throws IOException {
        String path = "D:\\Img\\" + fileName;
        File file = new File(path);
        InputStream is = new FileInputStream(file);
        byte[] data = IOUtils.toByteArray(is);
        HttpHeaders headers = getHeaderContent(fileName);
        return new ResponseEntity<>(data, headers, HttpStatus.OK);
    }

    private HttpHeaders getHeaderContent(String fileName){
        String fileType = FilenameUtils.getExtension(fileName);
        HttpHeaders headers = new HttpHeaders();
        if (fileType.equals("png")){
            headers.setContentType(MediaType.IMAGE_PNG);
        }
        if(fileType.equals("jpg")){
            headers.setContentType(MediaType.IMAGE_JPEG);
        }
        if(fileType.equals("gif")){
            headers.setContentType(MediaType.IMAGE_GIF);
        }
        return headers;
    }
}
