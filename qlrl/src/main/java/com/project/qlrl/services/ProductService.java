package com.project.qlrl.services;

import com.project.qlrl.models.Order;
import com.project.qlrl.models.Product;
import com.project.qlrl.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductService {

    @Autowired
    ProductRepository productRepository;


    public Map<Object, Object> productDetail(Map param){
        return productRepository.getProductById(param);
    }

    public List<Map<Object,Object>> getRelatedProduct(Map param){
        return productRepository.getRelatedProduct(param);
    }

    public Map<Object,Object> addToCart(Map<Object,Object> param){
        Map<Object,Object> result = new HashMap<>();

        try {
            String cartId = productRepository.getCartByUserName(param).get("CART_ID").toString();
            param.put("cartId", cartId);
            try {
                int oldQuantity = productRepository.checkProductExitsInCart(param);
                int newQuantity = Integer.parseInt(param.get("quantity").toString()) + oldQuantity;
                param.put("quantity", newQuantity);
                productRepository.updateCartDetail(param);
            }catch (Exception e){
                productRepository.addToCart(param);
            }
            result.put("success", "success");
        }catch (Exception e){
            result.put("error", "error");
        }
        return result;
    }

    public Map<Object, Object> getShoppingCart(Map param){
        Map<Object, Object> result = new HashMap<>();
        try {
            String cartId = productRepository.getCartByUserName(param).get("CART_ID").toString();
            param.put("cartId", cartId);
            result.put("data", productRepository.getShoppingCart(param));
        }catch (Exception e){
            result.put("err","err");
        }
        return result;
    }

    public Map<Object,Object> changeQuantityInCart(Map param){
        Map<Object, Object> result = new HashMap<>();
        try {
            String cartId = productRepository.getCartByUserName(param).get("CART_ID").toString();
            param.put("cartId", cartId);
            result.put("success", productRepository.updateCartDetail(param));
        }catch (Exception e){
            result.put("err","err");
        }
        return result;
    }

    public Map<Object,Object> deleteProductInCart(Map param){
        Map<Object, Object> result = new HashMap<>();
        try {
            String cartId = productRepository.getCartByUserName(param).get("CART_ID").toString();
            param.put("cartId", cartId);
           result.put("success", productRepository.deleteProductInCart(param));
        }catch (Exception e){
            result.put("err", "err");
        }
        return result;
    }

    public Map<Object,Object> saveOrder(Map param){
        Map<Object, Object> result = new HashMap<>();
        try {
            Order order = new Order();
            order.setUserId(Long.parseLong(param.get("userId").toString()));
            order.setReceiverName(param.get("receiverName").toString());
            order.setReceiverPhone(param.get("receiverPhone").toString());
            order.setAddress(param.get("address").toString());
            order.setTotal(param.get("total").toString());
            order.setNote(param.get("note").toString());
            productRepository.saveOrder(order);
            long orderId = order.getOrderId();

            List<Map<Object,Object>> lstProduct = (List<Map<Object, Object>>) param.get("lstProduct");
            for (int i = 0; i < lstProduct.size(); i++) {
                lstProduct.get(i).put("orderId", orderId);
                productRepository.addProductToOrder(lstProduct.get(i));
                productRepository.deleteCartDetail(lstProduct.get(i));
            }

            result.put("success","success");
        }catch (Exception e){
            e.printStackTrace();
            result.put("error", "error");
        }
        return result;
    }

    public Map<Object, Object> getProductByCategory(Map param){
        Map<Object, Object> result = new HashMap<>();
        try {
            if(param.get("id").toString().equals("0")){
                result.put("data", productRepository.getPromotionCategory(param));
            }else {
                result.put("data", productRepository.getProductByCategory(param));
            }
        }catch (Exception e){
            e.printStackTrace();
            result.put("err", "err");
        }
        return result;
    }
    public Map<Object,Object> getPromotionCategory(Map param){
        Map<Object, Object> result = new HashMap<>();
        try {
            result.put("data", productRepository.getPromotionCategory(param));
        }catch (Exception e){
            e.printStackTrace();
            result.put("err", "err");
        }
        return result;
    }

    public Map<Object,Object> search(Map param){
        Map<Object, Object> result = new HashMap<>();
        try {
            result.put("data", productRepository.search(param));
        }catch (Exception e){
            e.printStackTrace();
            result.put("err", "err");
        }
        return result;
    }
    public Map<Object,Object> addProduct(Map param){
        Map<Object, Object> result = new HashMap<>();
        try {
            Product product = new Product();

            product.setProductName(param.get("productName").toString());
            if(!param.get("promotionId").toString().equals("")){
                product.setPromotionId(Long.parseLong(param.get("promotionId").toString()));
            }

            product.setImage(param.get("image").toString());
            if(param.get("description") != null){
                product.setDescription(param.get("description").toString());
            }

            product.setPrice(Integer.parseInt(param.get("price").toString()));
            product.setCategoryId(Long.parseLong(param.get("categoryId").toString()));

            productRepository.addProduct(product);
            long id = product.getProductId();
            Map<Object,Object> paramWareHouse = new HashMap<>();
            paramWareHouse.put("productId", id);
            paramWareHouse.put("quantity", param.get("quantity"));

            result.put("success", productRepository.addProductToWareHouse(paramWareHouse));
        }catch (Exception e){
            e.printStackTrace();
            result.put("err", "err");
        }
        return result;
    }

    public Map editProduct(Map param){
        Map<Object, Object> result = new HashMap<>();
        try {
            productRepository.updateWareHouse(param);
            result.put("success", productRepository.editProduct(param));
        }catch (Exception e){
            e.printStackTrace();
            result.put("error","error");
        }
        return result;
    }

    public Map deleteProduct(Map param){
        Map<Object, Object> result = new HashMap<>();
        try {
            productRepository.deleteProductInWareHouse(param);
            result.put("success", productRepository.deleteProduct(param));
        }catch (Exception e){
            e.printStackTrace();
            result.put("error","error");
        }
        return result;
    }

    public Map<Object,Object> getDataProductMngForm(){
        Map<Object, Object> result = new HashMap<>();
        try {
            result.put("lstPromotion", productRepository.getPromotion());
            result.put("lstCategory", productRepository.getAllCategory());
        }catch (Exception e){
            e.printStackTrace();
            result.put("err", "err");
        }
        return result;
    }
    public Map<Object,Object> getProductMng(){
        Map<Object, Object> result = new HashMap<>();
        try {
            result.put("data", productRepository.getProductMng());
        }catch (Exception e){
            e.printStackTrace();
            result.put("err", "err");
        }
        return result;
    }

    public Map<Object,Object> getMyOrder(Map param){
        Map<Object, Object> result = new HashMap<>();
        try {
            result.put("data", productRepository.getMyOrder(param));
        }catch (Exception e){
            e.printStackTrace();
            result.put("err", "err");
        }
        return result;
    }

    public Map<Object,Object> getAllOrder(){
        Map<Object, Object> result = new HashMap<>();
        try {
            result.put("data", productRepository.getAllOrder());
        }catch (Exception e){
            e.printStackTrace();
            result.put("err", "err");
        }
        return result;
    }

}
