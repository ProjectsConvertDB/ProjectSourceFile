package org.momento.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	final String USER = "momento";
	final String PASS = "momento";

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch ( Exception e ) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		
		try(Connection con = DriverManager.getConnection(URL, USER, PASS)) {
			log.info(con);
		} catch ( Exception e ) {
			fail(e.getMessage());
		}
		
	}
	
}