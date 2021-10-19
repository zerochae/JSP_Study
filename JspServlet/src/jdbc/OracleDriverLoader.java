package jdbc;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

//HttpServlet 클래스를  상속
public class OracleDriverLoader extends HttpServlet {

	@Override
	public void init(ServletConfig config) throws ServletException {
		try {
			// Oracle JDBC 드라이버를 로딩함
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			// JDBC driver를 로딩 ㅣ 오류발생하면 excep4tion
			throw new ServletException(e);
		}
	}

}
