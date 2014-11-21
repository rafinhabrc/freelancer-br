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
import javax.persistence.Table;

@Entity(name = "HABILIDADES")
@Table(name = "HABILIDADES")
public class Habilidades implements Serializable {
	
	private static final long serialVersionUID = 3983198552507419219L;
	
	private Long id;
	private String descricao;
	private Integer nivel;
	private Collection<FreelancerHabilidades> freelancerHabilidadeList;
	
	@Id
	@GeneratedValue
	@Column(name = "id", nullable = false)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name = "descricao", nullable = false)
	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	@Column(name = "nivel", nullable = false)
	public Integer getNivel() {
		return nivel;
	}

	public void setNivel(Integer nivel) {
		this.nivel = nivel;
	}
	
	@OneToMany(mappedBy = "habilidades", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	public Collection<FreelancerHabilidades> getFreelancerHabilidadeList() {
		return freelancerHabilidadeList;
	}
	
	public void setFreelancerHabilidadeList(Collection<FreelancerHabilidades> freelancerHabilidadeList) {
		this.freelancerHabilidadeList = freelancerHabilidadeList;
	}
}
