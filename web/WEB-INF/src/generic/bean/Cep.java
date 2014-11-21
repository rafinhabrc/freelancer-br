package generic.bean;

public class Cep {

	private String estado;
	private String cidade;
	private String bairro;
	private String endereco;
	private String cep;

	public Cep(String cep, String estado, String cidade, String bairro, String endereco) {
		this.estado = estado;
		this.cidade = cidade;
		this.bairro = bairro;
		this.endereco = endereco;
		this.cep = cep;
	}

	public String getUf() {
		return estado;
	}

	public void setUf(String estado) {
		this.estado = estado;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}
}