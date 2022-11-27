package com.project.qlrl.repository;

import com.project.qlrl.models.Order;
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
}
