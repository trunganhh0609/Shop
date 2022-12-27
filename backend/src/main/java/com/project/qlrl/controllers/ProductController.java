package com.project.qlrl.controllers;

import com.project.qlrl.models.Product;
import com.project.qlrl.services.ProductService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class ProductController {
    String pathImg= "C:\\Users\\admin\\Desktop\\Shop";
    @Autowired
    ProductService productService;

    @Autowired
    ServletContext context;

    @GetMapping("/public/productDetail")
    public Map<Object, Object> productDetail(@RequestParam Map param){
        return productService.productDetail(param);
    }
    @GetMapping("/public/relatedProduct")
    public List<Map<Object, Object>> relatedProduct(@RequestParam Map param){
        System.out.println(productService.getRelatedProduct(param));
        return productService.getRelatedProduct(param);
    }

    @PostMapping("/addToCart")
    public Map<Object,Object> addToCart(@RequestBody Map param){
        return productService.addToCart(param);
    }

    @GetMapping("/shoppingCart")
    public Map<Object, Object> shoppingCart(@RequestParam Map param){
        return productService.getShoppingCart(param);
    }
    @PostMapping("/changeQuantityInCart")
    public Map<Object,Object> changeQuantityInCart(@RequestBody Map param){
        return productService.changeQuantityInCart(param);
    }

    @PostMapping("/deleteProductInCart")
    public Map<Object,Object> deleteProductInCart(@RequestBody Map param){
        return  productService.deleteProductInCart(param);
    }

    @PostMapping("/saveOrder")
    public Map<Object, Object> saveOrder(@RequestBody Map param){
        return productService.saveOrder(param);
    }

    @GetMapping("/public/getProductByCategory")
    public Map<Object,Object> getProductByCategory(@RequestParam Map param){
        return productService.getProductByCategory(param);
    }

    @GetMapping("getMyOrder")
    public Map<Object,Object> getMyOrder(@RequestParam Map param){
        return productService.getMyOrder(param);
    }

    @GetMapping("/public/search")
    public Map<Object,Object> search(@RequestParam Map param){
        return productService.search(param);
    }

    public String saveFileSever(MultipartFile file) throws IOException {
        Map data = new HashMap<>();
        data.put("fileName", file.getOriginalFilename());
        data.put("fileData", file.getBytes());

        boolean isExist = new File("D:\\Img").exists();

        if(!isExist){
            new File("D:\\Img").mkdir();
        }

        String fileName = file.getOriginalFilename();
        String path = "";
        String modifiedFileName = FilenameUtils.getBaseName(fileName) + "_" + System.currentTimeMillis() + "." + FilenameUtils.getExtension(fileName);
        File serveFile = new File("D:\\Img" + File.separator + modifiedFileName);
        try {
            FileUtils.writeByteArrayToFile(serveFile, file.getBytes());
//            String CURRENT_FOLDER = System.getProperty("user.dir");
//            path = CURRENT_FOLDER + "/src/main/webapp/dataImg/" + modifiedFileName;
            path = modifiedFileName;

        }catch (Exception e){
            e.printStackTrace();
        }

        return path;
    }
    @PostMapping("/public/uploadImg")
    public Map<Object,Object> uploadImg(@RequestParam("image") MultipartFile file){
        Map<Object, Object> result = new HashMap<>();
        try {
            result.put("path",saveFileSever(file));
        }catch (Exception e){
            e.printStackTrace();
            result.put("error", "error");
        }
        return result;
    }

    @PostMapping("/addProduct")
    public Map<Object, Object> addProduct(@RequestBody Map param) throws IOException {
        return productService.addProduct(param);
    }

    @PostMapping("/editProduct")
    public Map<Object,Object> editProduct(@RequestBody Map param){
        return productService.editProduct(param);
    }

    @PostMapping("/deleteProduct")
    public Map<Object,Object> deleteProduct(@RequestBody Map param){
        return productService.deleteProduct(param);
    }

    @GetMapping("/getDataProductMngForm")
    public Map<Object,Object> getDataProductMngForm(){
        return productService.getDataProductMngForm();
    }

    @GetMapping("/getProductMng")
    public Map<Object,Object> getProductMng(@RequestParam Map<Object,Object> param){
        return productService.getProductMng(param);
    }

    @GetMapping("/getAllOrder")
    public Map<Object, Object>getAllOrder(){
        return productService.getAllOrder();
    }
}
