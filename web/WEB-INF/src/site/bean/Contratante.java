package site.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "USUARIO_CONTRATANTE")
@Table(name = "USUARIO_CONTRATANTE")
public class Contratante implements Serializable {

	private static final long serialVersionUID = -5292920977133560324L;
	
	private Long id;
	private String atividades;
	private String experiencia;
	private String facebook;
	private String linkedin;
	private String site;

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

}
