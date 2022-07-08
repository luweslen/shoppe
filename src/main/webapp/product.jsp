<%@page import="br.com.shoppe.database.Products"%>
<%@page import="br.com.shoppe.models.Product"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    int id = Integer. parseInt(request.getParameter("id"));
    Product product = Products.getProduct(id);
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&family=Nunito:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
        
        <link href="assets/css/header.css" rel="stylesheet">
        <link href="assets/css/footer.css" rel="stylesheet">
        <link href="assets/css/product-page.css" rel="stylesheet">
        
        <link rel="icon" type="image/x-icon" href="assets/favicon.svg"> 

        <title><%=product.getName()%></title>
        
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                
                font-family: 'DM Sans', sans-serif;
            }
            
            body {
                display: flex;
                flex-direction: column;
                align-items: center;
            }
        </style>
    </head>
    <body>
        <jsp:include page='/header.jsp'></jsp:include>
        <div class="product-page">
            <div class="images">
                <div class="thumbnails">
                    <% 
                        for(int count = 0; count < 4; count++){
                    %>
                        <img src="<%=product.getImage()%>" alt="<%=product.getName()%>">
                    <% } %>
                </div>
                <img class="cover" src="<%=product.getImage()%>" alt="<%=product.getName()%>">
            </div>
            <div class="info">
                <h1><%=product.getName()%></h1>
                <%
                    Locale brazil = new Locale("pt", "BR");
                    NumberFormat format = NumberFormat.getCurrencyInstance(brazil);
                    String formattedPrice = format.format(product.getPrice());    
                %>
                <span class="price"><%=formattedPrice%></span>
                <div class="evaluation">
                    <% 
                        for(int count = 0; count < product.getEvaluation(); count++){
                    %>
                        <img src="assets/star.svg" alt="Star">
                    <% } %>
                </div>
                <span class="description"><%=product.getDescription()%></span>
                <button>Adicionar ao carrinho</button>
            </div>
        </div>
        <jsp:include page='/footer.jsp'></jsp:include>
    </body>
</html>
