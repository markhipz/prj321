<%-- 
    Document   : admin
    Created on : Mar 4, 2022, 3:18:11 PM
    Author     : markhipz
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="user.Product"%>
<%@page import="java.util.List"%>
<%@page import="user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("LOGIN_USER");
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            List<Product> listProduct = (List<Product>) session.getAttribute("PRODUCT_LIST");
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        %>
        <h1>Welcome <%=user.getFullName()%> to Admin page</h1>
        <a href="MainController?action=Logout" >Logout</a>
        <% if (listProduct == null) {
        %>
        <h1>There are no product</h1>
        <%  } else {
        %>
        <table border="1">
            <thead>
                <tr>                   
                    <th>No.</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Category ID</th>
                    <th>Import Date</th>
                    <th>Using Date</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <%if (listProduct.size() > 0) {
                        int count = 1;
                        for (Product product : listProduct) {%>
                <tr>
                    <td><%= count++%></td>
                    <td><%= product.getProductID()%></td>
                    <td>
                        <input type="text" name="fullName" value="<%= product.getProductName()%>" />
                    </td>
                    <td><img src="<%= product.getImage()%>" /></td>
                    <td>
                        <input type="text" name="price" value="<%= product.getPrice()%>" />
                    </td>
                    <td>
                        <input type="text" name="quantity" value="<%= product.getQuantity()%>" />
                    </td>
                    <td>
                        <input type="text" name="categoryID" value="<%= product.getCategoryID()%>" />
                    </td>
                    <td>
                        <input type="text" name="importDate" value="<%= sdf.format(product.getImportDate())%>" />
                    </td>
                    <td>
                        <input type="text" name="usingDate" value="<%= sdf.format(product.getUsingDate())%>" />
                    </td>
                    <td>
                        <input type="submit" name="action" value="Update" />
                        <input type ="hidden" name="userID" value="<%=product.getProductID()%>"
                    </td>
                    <td>
                        <a href="MainController?action=DeleteProduct&productID=<%=product.getProductID()%>">Delete</a>
                    </td>
                </tr>
                <%}
                        }
                    }%>
            </tbody>
        </table>

    </body>
</html>
