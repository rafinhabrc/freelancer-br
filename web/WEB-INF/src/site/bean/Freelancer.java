package site.bean;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity(name = "USUARIO_FREELANCER")
@Table(name = "USUARIO_FREELANCER")
public class Freelancer implements Serializable {

	private static final long serialVersionUID = 6996322186095830838L;
	
	private Long id;
	private String atividades;
	private String experiencia;
	private String facebook;
	private String linkedin;
	private String site;
	private Collection<FreelancerHabilidades> freelancerHabilidadeList;
	private Collection<Servicos> servicoList;

	@Id
	@GeneratedValue
	@Column(name = "id", nullable = false)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name = "atividades", nullable = true)
	public String getAtividades() {
		return atividades;
	}

	public void setAtividades(String atividades) {
		this.atividades = atividades;
	}
	
	@Column(name = "experiencia", nullable = true)
	public String getExperiencia() {
		return experiencia;
	}

	public void setExperiencia(String experiencia) {
		this.experiencia = experiencia;
	}
	
	@Column(name = "facebook", nullable = true)
	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
	
	@Column(name = "linkedin", nullable = true)
	public String getLinkedin() {
		return linkedin;
	}
	
	public void setLinkedin(String linkedin) {
		this.linkedin = linkedin;
	}
	
	@Column(name = "site", nullable = true)
	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}
	
	@OneToMany(mappedBy = "freelancer", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	public Collection<FreelancerHabilidades> getFreelancerHabilidadeList() {
		return freelancerHabilidadeList;
	}
	
	public void setFreelancerHabilidadeList(Collection<FreelancerHabilidades> freelancerHabilidadeList) {
		this.freelancerHabilidadeList = freelancerHabilidadeList;
	}
	
	@OrderBy("dataCadastro DESC")
	@OneToMany(mappedBy = "freelancer", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	public Collection<Servicos> getServicoList() {
		return servicoList;
	}
	
	public void setServicoList(Collection<Servicos> servicoList) {
		this.servicoList = servicoList;
	}
	
	@Transient
	public String getAtividadesString() {
		String atividades = this.atividades.replaceAll("\n", "<br>");

		return atividades;
	}
	
	@Transient
	public String getExperienciaString() {
		String experiencia = this.experiencia.replaceAll("\n", "<br>");

		return experiencia;
	}
}
