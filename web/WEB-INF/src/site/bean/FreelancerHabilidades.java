package site.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity(name = "FREELANCER_HABILIDADES")
@Table(name = "FREELANCER_HABILIDADES")
public class FreelancerHabilidades implements Serializable {

	private static final long serialVersionUID = 25056698440547607L;
	
	private Long id;
	private Freelancer freelancer;
	private Habilidades habilidades;

	@Id
	@GeneratedValue
	@Column(name = "id", nullable = false)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@ManyToOne
	@JoinColumn(name = "fk_freelancer", nullable = false)
	public Freelancer getFreelancer() {
		return freelancer;
	}

	public void setFreelancer(Freelancer freelancer) {
		this.freelancer = freelancer;
	}

	@ManyToOne
	@JoinColumn(name = "fk_habilidades", nullable = false)
	public Habilidades getHabilidades() {
		return habilidades;
	}

	public void setHabilidades(Habilidades habilidades) {
		this.habilidades = habilidades;
	}
}
