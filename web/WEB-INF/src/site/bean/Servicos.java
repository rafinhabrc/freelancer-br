package site.bean;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity(name = "FREELANCER_SERVICOS")
@Table(name = "FREELANCER_SERVICOS")
public class Servicos implements Serializable {

	private static final long serialVersionUID = -8246747773963752963L;
	
	private Long id;
	private Freelancer freelancer;
	private Boolean valorCombinar;
	private Calendar dataCadastro;
	private Double valorServico;
	private String imagem;
	private String descricao;
	private String titulo;
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

	@ManyToOne
	@JoinColumn(name = "fk_freelancer", nullable = false)
	public Freelancer getFreelancer() {
		return freelancer;
	}

	public void setFreelancer(Freelancer freelancer) {
		this.freelancer = freelancer;
	}

	@Column(name = "valorCombinar", nullable = false)
	public Boolean getValorCombinar() {
		return valorCombinar;
	}

	public void setValorCombinar(Boolean valorCombinar) {
		this.valorCombinar = valorCombinar;
	}

	@Column(name = "dataCadastro", nullable = false)
	public Calendar getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Calendar dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	@Column(name = "valorServico", nullable = true)
	public Double getValorServico() {
		return valorServico;
	}

	public void setValorServico(Double valorServico) {
		this.valorServico = valorServico;
	}

	@Column(name = "imagem", nullable = true)
	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	@Column(name = "descricao", nullable = false)
	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	@Column(name = "titulo", nullable = false)
	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	@OneToMany(mappedBy = "servicos", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	public Collection<ServicosCategoria> getServicosCategoriaList() {
		return servicosCategoriaList;
	}
	
	public void setServicosCategoriaList(Collection<ServicosCategoria> servicosCategoriaList) {
		this.servicosCategoriaList = servicosCategoriaList;
	}
	
	@Transient
	public String getValorServicoString() {
		DecimalFormat formatador = new DecimalFormat("R$ #,##0.00");
		return formatador.format(valorServico);
	}
}
