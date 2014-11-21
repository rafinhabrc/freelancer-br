package site.dao;

import generic.dao.Dao;

import org.hibernate.Query;
import org.hibernate.Session;

import site.bean.FreelancerHabilidades;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class DaoFreelancerHabilidades extends Dao<FreelancerHabilidades> {

	public DaoFreelancerHabilidades(Session session) {
		super(session, FreelancerHabilidades.class);
	}
	
	public Boolean verificaHabilidade(Long idHabilidade) {
		String consulta = "SELECT * FROM FREELANCER_HABILIDADES WHERE fk_habilidades = :idHabilidade";
		
		Query query = super.getSession().createSQLQuery(consulta);
		query.setParameter("idHabilidade", idHabilidade);

		if (query.list().size() > 0)
			return true;
		else
			return false;
	}
	
	public void limparHabilidades(Long idFreelancer) {
		String consulta = "DELETE FROM FREELANCER_HABILIDADES WHERE fk_freelancer = :idFreelancer";
		
		Query query = super.getSession().createSQLQuery(consulta);
		query.setParameter("idFreelancer", idFreelancer);
		
		query.executeUpdate();
	}
}