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
    public List<String> getProductNamesWithTotalPriceLargerThan(double amount) {
        List<String> result = new ArrayList<String>();
        // your code here
        String sqlstr = "SELECT DISTINCT name FROM Sales, Products" +
			" WHERE quantity * unit_price > ?" +
			" 	and Sales.product_id = Products.product_id";
        try {
            PreparedStatement prest = connection.prepareStatement(sqlstr);
            prest.setDouble(1, amount);
            ResultSet rs = prest.executeQuery();
            while(rs.next())
            {
                String product_name = rs.getString(1);
//                System.out.println(product_name);
                result.add(product_name);
            }
        }catch (SQLException e ) {
            System.out.print("SQLException" + e);
        }
        return result;
    }

    /**
     * Add a product to the database. If the product's name and manufacturer
     * already exists in the database, return the product's id. Otherwise,
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
        try {
            
            connection.setAutoCommit(false);
            Statement st = connection.createStatement();
            
            // Set Transaction level
            connection.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
            ResultSet rs = st.executeQuery("SELECT current_setting('transaction_isolation')");
            rs.next();
            String iso = rs.getString(1);
            if (iso.equals("serializable")){
                System.out.println("Set Isolation Level to Serializable");
            } else {
                System.out.println("Uable to set Isolation Level, currently " + iso);
                System.exit(0);
            }
            
            // Check Already Exist
            rs = st.executeQuery("SELECT product_id ,name, manufacturer FROM Products");
            int new_id = 0;
            while(rs.next())
            {
                int item_id = rs.getInt("product_id");
                String product_name = rs.getString("name").trim();
                String product_manufacturer = rs.getString("manufacturer").trim();
                // Exist
                if (manufacturer.equals(product_manufacturer) && name.equals(product_name)){
                    System.out.println("Item : " + name + "-" + manufacturer + " Already Exist");
                    return item_id;
                }
                //Gen Id
                if (new_id <= item_id){
                    new_id = item_id + 1;
                }
            }
            
            // Not Exist, insert
            String sqlstr = "INSERT INTO Products VALUES (?,?,NULL,?)";
            PreparedStatement prest = connection.prepareStatement(sqlstr);
            prest.setInt(1, new_id);
            prest.setString(2, name);
            prest.setString(3, manufacturer);
            prest.execute();
            productId = new_id;
            
            // Commit
            connection.commit();
            System.out.println("Item : " + name + "-" + manufacturer + " Added");
            
        // Insertion Fail
        }catch (SQLException e ) {
            System.out.print("SQLException" + e);
            try {
                connection.rollback();
            } catch (SQLException ex){
                System.out.print("rollback -> SQLException" + ex);
            }
        // Make AutoCommit back to true since the transaction is only for this function
        }finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex){
                System.out.print("setAutoCommit -> SQLException" + ex);
            }
        }
        
        // end of your code
        return productId;
    }

};
