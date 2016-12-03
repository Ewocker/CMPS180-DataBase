import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A class that connects to PostgreSQL and disconnects.
 * You will need to change your credentials below, to match the usename and password of your account
 * in the PostgreSQL server.
 * The name of your database in the server is the same as your username.
 * You are asked to include code that tests the methods of the SalesApplication class
 * in a similar manner to the sample RunStoreApplication.java program.
*/


public class RunSalesApplication
{
    public static void main(String[] args) {
    	
    	Connection connection = null;
    	try {
    		//Register the driver
    		Class.forName("org.postgresql.Driver"); 
    		// Make the connection.
            // You will need to fill in your real username
            // and password for your Postgres account in the arguments of the
            // get Connection method below.
            connection = DriverManager.getConnection(
                                                     "jdbc:postgresql://cmps180-db.lt.ucsc.edu/ylin62",
                                                     "ylin62",
                                                     "Ew850509");
            
            if (connection != null)
                System.out.println("Connected to the database!");

            /* Include your code below to test the methods of the SalesApplication class
             * The sample code in RunStoresApplication.java should be useful.
             * That code tests other methods for a different database schema.
             * Your code below: */
            
            // Create Object
           	SalesApplication app = new SalesApplication(connection);

            double amount = 500;
            List<String> titles = app.getProductNamesWithTotalPriceLargerThan(amount);
            System.out.println("Result of getProductNamesWithTotalPriceLargerThan: ");
            for (String title : titles)
                System.out.println(title);
            
            System.out.println("");
            System.out.println("Result of addProduct: ");
            // Already Exist
            int id = app.addProduct("Iphone 7","Apple");
            System.out.println(id);
            // Not Yet Exist
            id = app.addProduct("TestName","TestManufacturer");
            System.out.println(id);
            
            //Other Tests
//            id = app.addProduct("b","Apple");
//            System.out.println(id);
//            id = app.addProduct("Iphone 7","c");
//            System.out.println(id);
            
            /*******************
            * Your code ends here */
            
    	}
        
        // Connection Fail Case
    	catch (SQLException | ClassNotFoundException e) {
    		System.out.println("Error while connecting to database: " + e);
    		e.printStackTrace();
    	}
    	finally {
    		if (connection != null) {
    			// Closing Connection
    			try {
					connection.close();
				} catch (SQLException e) {
					System.out.println("Failed to close connection: " + e);
					e.printStackTrace();
				}
    		}
    	}
    }
}
