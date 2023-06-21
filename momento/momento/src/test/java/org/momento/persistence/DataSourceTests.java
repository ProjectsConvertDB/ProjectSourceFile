package org.momento.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DataSourceTests {

	@Setter(onMethod_ = { @Autowired })
	private DataSource dataSource;
	
	@Setter(onMethod_ = { @Autowired })
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testConnection() {
		
		System.out.println("\n");
		log.info("------------------------------------------------ hikari CP ---------------------------------------------------");
		System.out.println();
		
		try (Connection con = dataSource.getConnection()) {
			log.info(con + "  [ hikari CP Connection 1 ]");
		} catch ( Exception e ) {
			fail(e.getMessage());
		}
		
		System.out.println();
		log.info("--------------------------------------------------------------------------------------------------------------");
		
		System.out.println("\n\n\n\n\n");
		
		log.info("--------------------------------------- Mybatis Session + hikari CP ------------------------------------------");
		System.out.println();
		
		try (SqlSession session = sqlSessionFactory.openSession();
				Connection con = session.getConnection();)
		{
			log.info(session + "  [ Mybatis Session ]");
			log.info(con + "  [ hikari CP Connection 2 ]");
		} catch ( Exception e ) {
			fail(e.getMessage());
		}
		
		System.out.println();
		log.info("--------------------------------------------------------------------------------------------------------------");
		System.out.println("\n");
		
	}
	
}
