package com.project.qlrl.repository;

import com.project.qlrl.models.Order;
import com.project.qlrl.models.Product;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface ProductRepository {
    List<Map<Object,Object>> getLstPromotionProduct();

    List<Map<Object,Object>> getNewProduct();

    Map<Object, Object> getProductById(Map param);

    List<Map<Object,Object>> getRelatedProduct(Map param);

    int addToCart(Map param);

    Map<Object,Object> getCartByUserName(Map param);

    int checkProductExitsInCart(Map param);

    int updateCartDetail(Map param);

    List<Map<Object,Object>> getShoppingCart(Map param);

    int deleteProductInCart(Map param);

    int saveOrder(Order order);

    int addProductToOrder(Map param);

    int deleteCartDetail(Map param);

    List<Map<Object,Object>> getProductByCategory(Map param);

    List<Map<Object,Object>> getPromotionCategory(Map param);

    List<Map<Object,Object>> search(Map param);

    int addProduct(Product param);

    int editProduct(Map param);

    List<Map<Object, Object>> getPromotionInThisTime();

    List<Map<Object, Object>> getPromotion();

    List<Map<Object, Object>> getAllCategory();

    int addProductToWareHouse(Map param);

    List<Map<Object, Object>> getProductMng();

    int deleteProduct(Map param);

    int deleteProductInWareHouse(Map param);

    int updateWareHouse(Map param);

    List<Map<Object, Object>> getMyOrder(Map param);

    List<Map<Object, Object>> getAllOrder();
}
