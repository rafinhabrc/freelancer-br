package generic.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Order;

@SuppressWarnings("unchecked")
public class Dao<T> {

	private final Session session;
	private final Class<?> classe;

	public Dao(Session session, Class<?> classe) {
		this.session = session;
		this.classe = classe;
	}

	protected Session getSession() {
		return this.session;
	}

	public void adicionar(T o) {
		this.session.save(o);
	}

	public void mesclar(T o) {
		this.session.merge(o);
	}

	public void atualizar(T o) {
		this.session.saveOrUpdate(o);
	}

	public void edicao(T o) {
		this.session.update(o);
	}

	public T buscar(Long id) {
		return (T) this.session.load(this.classe, id);
	}

	public void remover(T o) {
		this.session.delete(o);
	}

	public List<T> listarTudo() {
		return this.session.createCriteria(classe).list();
	}

	public List<T> listarTudo(String campo, String order) {
		if (order.equals("ASC"))
			return session.createCriteria(this.classe)
					.addOrder(Order.asc(campo)).list();
		else if (order.equals("DESC"))
			return session.createCriteria(this.classe)
					.addOrder(Order.desc(campo)).list();
		else
			return session.createCriteria(this.classe).list();
	}

}