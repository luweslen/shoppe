package br.com.shoppe.database;

import br.com.shoppe.models.Product;
import java.util.ArrayList;

public class Products {
    public static ArrayList<Product> data = Products.startData();
    
    public static ArrayList<Product> startData(){
        System.out.println("br.com.shoppe.database.Products.startData()");
        ArrayList<Product> products = new ArrayList<Product>();
        ArrayList<String> images = new ArrayList<>();
        
        images.add("https://i.imgur.com/LRHHkQA.png");
        images.add("https://i.imgur.com/WvLq9HP.png");
        images.add("https://i.imgur.com/vqaV1KY.png");
        images.add("https://i.imgur.com/uyMGY9q.png");
        images.add("https://i.imgur.com/uyMGY9q.png");
        images.add("https://i.imgur.com/1hYaShn.png");
        images.add("https://i.imgur.com/Be8jF7I.png");

        for(int count = 1; count <= 10; count++){
            int indexImage = (int)Math.floor(Math.random()*((images.size() - 1)+1));
            int evaluation = (int)Math.floor(Math.random()*5);
            String image = images.get(indexImage);
            
            Product product = new Product();
            product.setId(count);
            product.setImage(image);
            product.setName("Product"+count);
            product.setPrice(((indexImage + 1) * (count + 1)) * 1.22);
            product.setDescription("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam placerat, augue a volutpat hendrerit, sapien tortor faucibus augue, a maximus elit ex vitae libero. Sed quis mauris eget arcu facilisis consequat sed eu felis. ");
            product.setEvaluation(evaluation);
            
            products.add(product);
        }
        
        return products;
    }
    
    public static Product getProduct(int id){
        Product product = new Product();
        for(Product currentProduct: Products.data){
            if(id == currentProduct.getId()){
                product = currentProduct;
                break;
            }
        }
        
        return product;
    }
}
