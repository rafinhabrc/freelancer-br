package generic.dao;

import generic.bean.Cep;
import generic.util.ControladorConexao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DaoCep {

	private ControladorConexao cc;
	private Connection conexao;
	private Statement stmt;
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String CONEXAO_ODBC = "jdbc:mysql://localhost:3306/";
	private static final String DATABASE = "cep";
	private static final String USUARIO = "root";
	private static final String SENHA = "";

	public Cep buscar(String cep) {
		Cep r = null;
		
		try {
			this.cc = new ControladorConexao();
			this.conexao = this.cc.openConnection(DRIVER, CONEXAO_ODBC, DATABASE, USUARIO, SENHA);
			
			String sql = "SELECT * FROM BuscaCep WHERE cep = '" + cep + "'";
			
			this.stmt = this.conexao.createStatement();
			ResultSet rs = this.stmt.executeQuery(sql);
			
			while (rs.next())
				r = new Cep(rs.getString("cep"), rs.getString("estado"), rs.getString("cidade"), rs.getString("bairro"), rs.getString("endereco"));
			
			rs.close();
			this.stmt.close();
			this.cc.closeConnection(conexao);
			
			return r;
		} catch(SQLException e) {
			System.out.println("Erro: DaoCep - BuscarCep");
			e.printStackTrace();
			
			return r;
		}
	}

}