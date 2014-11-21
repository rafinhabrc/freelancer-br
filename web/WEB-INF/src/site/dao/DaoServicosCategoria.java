package site.dao;

import generic.dao.Dao;

import java.util.ArrayList;
import java.util.Collection;

import org.hibernate.Query;
import org.hibernate.Session;

import site.bean.ServicosCategoria;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class DaoServicosCategoria extends Dao<ServicosCategoria> {

	public DaoServicosCategoria(Session session) {
		super(session, ServicosCategoria.class);
	}

	public Boolean verificaCategoria(Long idCategoria) {
		String consulta = "SELECT * FROM SERVICOS_CATEGORIA WHERE fk_categoria = :idCategoria";

		Query query = super.getSession().createSQLQuery(consulta);
		query.setParameter("idCategoria", idCategoria);

		if (query.list().size() > 0)
			return true;
		else
			return false;
	}

	public void limparCategorias(Long idServico) {
		String consulta = "DELETE FROM SERVICOS_CATEGORIA WHERE fk_servicos = :idServico";

		Query query = super.getSession().createSQLQuery(consulta);
		query.setParameter("idServico", idServico);

		query.executeUpdate();
	}

	public Collection<ServicosCategoria> buscarPorCategoria(String categoria) {
		Collection<ServicosCategoria> lista = new ArrayList<ServicosCategoria>();

		String consulta = "FROM SERVICOS_CATEGORIA WHERE categoria.descricao LIKE :categoria ORDER BY id ASC";

		Query query = super.getSession().createQuery(consulta);
		query.setParameter("categoria", "%" + categoria + "%");

		for(int x = 0; x < query.list().size(); x++) {
			ServicosCategoria item = (ServicosCategoria) query.list().get(x);
			lista.add(item);
		}

		return lista;
	}
	
	public Collection<ServicosCategoria> buscarPorFiltro(String filtro) {
		Collection<ServicosCategoria> lista = new ArrayList<ServicosCategoria>();

		String consulta = "FROM SERVICOS_CATEGORIA WHERE categoria.descricao LIKE :filtro OR servicos.titulo LIKE :filtro OR "
				+ "servicos.descricao LIKE :filtro ORDER BY id ASC";

		Query query = super.getSession().createQuery(consulta);
		query.setParameter("filtro", "%" + filtro + "%");

		for(int x = 0; x < query.list().size(); x++) {
			ServicosCategoria item = (ServicosCategoria) query.list().get(x);
			lista.add(item);
		}

		return lista;
	}
}