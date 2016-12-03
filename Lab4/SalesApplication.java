import java.sql.*;
import java.util.*;

/**
 * The class implements methods of the Sales database
 * interface.
 *
 * All methods of the class receive a Connection object through which all
 * communication to the database should be performed. Note: the
 * Connection object should not be closed by any method.
 *
 * Also, no method should throw any exceptions. In particular, in case
 * that an error occurs in the database, then the method should print an
 * error message and call System.exit(-1);
 */
public class SalesApplication {

    private Connection connection;
    
    /*
     * Constructor
     */
    public SalesApplication(Connection connection) {
        this.connection = connection;
    }
    
    public Connection getConnection()
    {
        return connection;
    }
    
     /**
     * Return list of product names for products whose total sales 
     * i.e. , the total price of the sales of the product across all sales in the table Sales
     * is greater than some specified amount.
     * You only need to consider entries in the table Sales, i.e. the method should not take into account
     * sales that are in the table NewSales and are not yet merged with the table Sales.
     */
    public List<String> getProductNamesWithTotalPriceLargerThan(double amount) throws SQLException {
        List<String> result = new ArrayList<String>();
        // your code here
        String sqlstr = "SELECT DISTINCT name FROM Sales, Products" +
			" WHERE quantity * unit_price > ?" +
			" 	and Sales.product_id = Products.product_id";
			
        PreparedStatement prest = connection.prepareStatement(sqlstr);
        prest.setDouble(1, amount);
        ResultSet rs = prest.executeQuery();
        while(rs.next())
        {
            System.out.print("Column 1 returned ");
            String product_name = rs.getString(1);
            System.out.println(product_name);
            result.add(product_name);
        }
        // end of your code
        return result;  
    }

    /**
     * Add a product to the database. If the product’s name and manufacturer
     * already exists in the database, return the product’s id. Otherwise,
     * add the product to the database, and return the new product id.
     * When a new product is added to the database, its category should be NULL.
     *
     * Adding a product and a manufacturer should be done
     * within a transaction. The isolation level should be Serializable.
     *
     * You will lose credit if this is not done in a transaction; you will get extra
     * credit if you do this in a stored procedure.
     */
    public int addProduct(String name, String manufacturer) {
        int productId = 0;
//        // your code here
//        String sqlstr = "INSERT INTO Products VALUES";
//        
//        PreparedStatement prest = connection.prepareStatement(sqlstr);
//        prest.setDouble(1, amount);
//        ResultSet rs = prest.executeQuery();
//        while(rs.next())
//        {
//            System.out.print("Column 1 returned ");
//            String product_name = rs.getString(1);
//            System.out.println(product_name);
//            result.add(product_name);
//        }
//        
//        
        
        // end of your code
        return productId;
    }

};
