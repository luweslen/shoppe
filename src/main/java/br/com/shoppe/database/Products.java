package br.com.shoppe.database;

import br.com.shoppe.models.Product;
import java.util.ArrayList;

public class Products {
    public static ArrayList<Product> data = Products.startData();
    
    public static ArrayList<Product> startData(){
        ArrayList<Product> products = new ArrayList<>();
        
        for(int count = 1; count <= 10; count++){
            Product product = new Product();
            products.add(product);
        }
        
        return products;
    }
}
