package site.dao;

import generic.dao.Dao;

import org.hibernate.Query;
import org.hibernate.Session;

import site.bean.Usuario;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class DaoUsuario extends Dao<Usuario> {

	public DaoUsuario(Session session) {
		super(session, Usuario.class);
	}

	public Usuario buscarPorEmail(String email) {
		Usuario usuario = null;
		
		String consulta = "FROM USUARIO WHERE email = :email";

		Query query = super.getSession().createQuery(consulta);
		query.setParameter("email", email);

		if (query.list().size() != 0 )
			usuario = (Usuario) query.list().get(0);

		query.setCacheable(true);

		return usuario;
	}
}