package site.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity(name = "SERVICOS_CATEGORIA")
@Table(name = "SERVICOS_CATEGORIA")
public class ServicosCategoria implements Serializable {

	private static final long serialVersionUID = -7394887609931003323L;
	
	private Long id;
	private Categoria categoria;
	private Servicos servicos;
	
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
	@JoinColumn(name = "fk_categoria", nullable = false)
	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}
	
	@ManyToOne
	@JoinColumn(name = "fk_servicos", nullable = false)
	public Servicos getServicos() {
		return servicos;
	}

	public void setServicos(Servicos servicos) {
		this.servicos = servicos;
	}
}
