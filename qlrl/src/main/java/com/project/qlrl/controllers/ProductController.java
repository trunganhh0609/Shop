package com.project.qlrl.controllers;

import com.project.qlrl.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class ProductController {

    @Autowired
    ProductService productService;

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

    @GetMapping("/getProductByCategory")
    public Map<Object,Object> getProductByCategory(@RequestParam Map param){
        return productService.getProductByCategory(param);
    }
}
