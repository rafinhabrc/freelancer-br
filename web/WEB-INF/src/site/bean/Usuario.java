package site.bean;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity(name = "USUARIO")
@Table(name = "USUARIO")
public class Usuario implements Serializable {

	private static final long serialVersionUID = 8439890805785923332L;
	
	private Long id;
	private Contratante contratante;
	private Fisico fisico;
	private Freelancer freelancer;
	private Juridico juridico;
	private Boolean ativo;
	private Calendar dataCadastro;
	private String bairro;
	private String cep;
	private String cidade;
	private String complemento;
	private String email;
	private String endereco;
	private String estado;
	private String foto;
	private String nomeVisualizacao;
	private String numero;
	private String password;
	private String telefoneComercial;
	private String telefoneContato;
	private String telefoneResidencial;
	
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
	@JoinColumn(name = "fk_contratante", nullable = true)
	public Contratante getContratante() {
		return contratante;
	}
	
	public void setContratante(Contratante contratante) {
		this.contratante = contratante;
	}
	
	@ManyToOne
	@JoinColumn(name = "fk_fisico", nullable = true)
	public Fisico getFisico() {
		return fisico;
	}
	
	public void setFisico(Fisico fisico) {
		this.fisico = fisico;
	}
	
	@ManyToOne
	@JoinColumn(name = "fk_freelancer", nullable = true)
	public Freelancer getFreelancer() {
		return freelancer;
	}
	
	public void setFreelancer(Freelancer freelancer) {
		this.freelancer = freelancer;
	}
	
	@ManyToOne
	@JoinColumn(name = "fk_juridico", nullable = true)
	public Juridico getJuridico() {
		return juridico;
	}
	
	public void setJuridico(Juridico juridico) {
		this.juridico = juridico;
	}
	
	@Column(name = "ativo", nullable = false)
	public Boolean getAtivo() {
		return ativo;
	}
	
	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}
	
	@Column(name = "dataCadastro", nullable = false)
	public Calendar getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Calendar dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
	
	@Column(name = "bairro", nullable = false)
	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	
	@Column(name = "cidade", nullable = false)
	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	
	@Column(name = "complemento", nullable = true)
	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	@Column(name = "cep", nullable = false)
	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	@Column(name = "email", nullable = false)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "endereco", nullable = false)
	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	@Column(name = "estado", nullable = false)
	public String getEstado() {
		return estado;
	}
	
	public void setEstado(String estado) {
		this.estado = estado;
	}

	@Column(name = "foto", nullable = true)
	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}
	
	@Column(name = "nomeVisualizacao", nullable = false)
	public String getNomeVisualizacao() {
		return nomeVisualizacao;
	}
	
	public void setNomeVisualizacao(String nomeVisualizacao) {
		this.nomeVisualizacao = nomeVisualizacao;
	}

	@Column(name = "numero", nullable = true)
	public String getNumero() {
		return numero;
	}
	
	public void setNumero(String numero) {
		this.numero = numero;
	}
	
	@Column(name = "password", nullable = false)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "telefoneComercial", nullable = true)
	public String getTelefoneComercial() {
		return telefoneComercial;
	}

	public void setTelefoneComercial(String telefoneComercial) {
		this.telefoneComercial = telefoneComercial;
	}
	
	@Column(name = "telefoneContato", nullable = false)
	public String getTelefoneContato() {
		return telefoneContato;
	}

	public void setTelefoneContato(String telefoneContato) {
		this.telefoneContato = telefoneContato;
	}
	
	@Column(name = "telefoneResidencial", nullable = true)
	public String getTelefoneResidencial() {
		return telefoneResidencial;
	}

	public void setTelefoneResidencial(String telefoneResidencial) {
		this.telefoneResidencial = telefoneResidencial;
	}
	
	@Transient
	public Boolean getContratanteTrue() {
		if (this.contratante.getId() != null)
			return true;
		else
			return false;
	}
	
	@Transient
	public Boolean getFisicoTrue() {
		if (this.fisico.getId() != null)
			return true;
		else
			return false;
	}
	
	@Transient
	public Boolean getFreelancerTrue() {
		if (this.freelancer.getId() != null)
			return true;
		else
			return false;
	}
	
	@Transient
	public Boolean getJuridicoTrue() {
		if (this.juridico.getId() != null)
			return true;
		else
			return false;
	}

}