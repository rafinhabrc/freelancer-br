package generic.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ControladorConexao {

	private Connection conn;

	public Connection openConnection(String driver, String url, String database, String user, String pass) {
		try {
			Class.forName(driver);
			this.conn = DriverManager.getConnection(url+database, user, pass); 
		} catch (ClassNotFoundException e) {
			System.out.println("Exc: ControladorConexao - Driver nao encontrado.");
			System.out.println(e);
		} catch (SQLException e) {
			System.out.println("Exc: ControladorConexao - Erro ao criar uma nova conexao.");
			System.out.println(e);
		}
		return this.conn;
	}

	public void closeConnection(Connection conn) {
		try {
			conn.close();
		} catch (SQLException e) {
			System.out.println("Exc: ControladorConexao - Erro ao fechar Conexao.");
		}
	}

}