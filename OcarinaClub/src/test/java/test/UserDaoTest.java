package test;

import javax.sql.DataSource;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.pcbs.ocarinaclub.service.UserService;

public class UserDaoTest {
	
	@Autowired
	private UserService userService;
	
	@Test
	public void test() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring.xml");
		DataSource dataSource = (DataSource) ac.getBean("dataSource");
		System.out.println(dataSource.getClass());
	}
}
