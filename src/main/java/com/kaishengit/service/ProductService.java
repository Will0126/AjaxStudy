package com.kaishengit.service;


import com.kaishengit.entity.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductService {

    public static List<Product> findAll() {

        Product product1 = new Product();
        product1.setId(108);
        product1.setName("Java修仙启蒙");
        product1.setPrice(66F);
        product1.setNum(50);
        product1.setAuthor("八方金仙");

        Product product2 = new Product();
        product2.setId(109);
        product2.setName("Java修仙基础");
        product2.setPrice(88F);
        product2.setNum(50);
        product2.setAuthor("九天玄女");

        Product product3 = new Product();
        product3.setId(110);
        product3.setName("Java修仙进阶");
        product3.setPrice(99F);
        product3.setNum(50);
        product3.setAuthor("十方仙帝");

        List<Product> productList = new ArrayList<Product>();
        productList.add(product1);
        productList.add(product2);
        productList.add(product3);

        return productList;

    }
}





