package jdbc;

import java.sql.DriverManager;

import javax.management.RuntimeErrorException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

//서블릿 클래스
public class DBCPInit extends HttpServlet {
	// 메소드 재정의
	@Override
	public void init() throws ServletException {
		 loadJDBCDriver();
		 initConnectionPool();
	}

	private void loadJDBCDriver() {
		try {
			// Connection Pool이 내부에서 사용할 JDBC Driver를 Loading함
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException ex) {
			throw new RuntimeException("fail to load JDBC Driver", ex);
		}
	}

	private void initConnectionPool() {

		try {
			String jdbcUrl = "jdbc:oracle:thin:@localhost:1521/xe";
			String username = "c##jspexam";
			String pw = "java";
			// ConnectionFactory(병원생성)
			// import org.apache.commons.dbcp2.###;
			// Connection Pool이 새로운 Connection을 생성시 사용할 factory
			ConnectionFactory connFactory = new DriverManagerConnectionFactory(jdbcUrl,username,pw);

			// PoolableConnectionFactory (의국 생성)
			// DBCP는 Connection Pool에 Connection 보관 시 PollableConnection을 사용
			PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactory, null);
			// 의국에 있는 의사가 유효한지 여부 체크
			// Connection이 유효한지 여부를 검사
			poolableConnFactory.setValidationQuery("select 1");
			// Connection Pool의 설정 정보를 생성
			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig<>();
			// 유휴 Connection 검사 주기(5분)
			// 놀고 있는 connection 객체를 pool에서 제거 (1/1000)초
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
			// 풀에 보관 중인 커넥션이 유효한지 검사할것인지 여부
			poolConfig.setTestWhileIdle(true);
			// 커넥션 최소 개수
			poolConfig.setMinIdle(4);
			// 커넥션 최대 개수
			poolConfig.setMaxTotal(50);
			GenericObjectPool<PoolableConnection> connectionPool = new GenericObjectPool<>(poolableConnFactory,
					poolConfig);
			poolableConnFactory.setPool(connectionPool);
			// 커넥션 풀을 제공하는 JDBC 드라이버를 등록
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");

			// before : jdbc:oracle:this:@localhost:1521/xe
			// after : jdbc:apache: commons :dbcp :ddit

			driver.registerPool("ddit", connectionPool);

		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}
}