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

@Entity(name = "CATEGORIA")
@Table(name = "CATEGORIA")
public class Categoria implements Serializable {

	private static final long serialVersionUID = 7592232022686741803L;
	
	private Long id;
	private String descricao;
	private Collection<ServicosCategoria> servicosCategoriaList;

	@Id
	@GeneratedValue
	@Column(name = "id", nullable = false)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name = "descricao", nullable = true)
	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	@OneToMany(mappedBy = "categoria", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	public Collection<ServicosCategoria> getServicosCategoriaList() {
		return servicosCategoriaList;
	}
	
	public void setServicosCategoriaList(Collection<ServicosCategoria> servicosCategoriaList) {
		this.servicosCategoriaList = servicosCategoriaList;
	}
}
