package generic.controller;

import generic.bean.Cep;
import generic.dao.DaoCep;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;

@Resource
public class CepController {

	private final DaoCep daoCep;
	private final Result result;

	public CepController(DaoCep daoCep, Result result) {
		this.daoCep = daoCep;
		this.result = result;
	}

	@Path("/cep/consulta/{cep}")
	public void index(String cep) {
		Cep endereco = daoCep.buscar(cep);

		if (endereco != null)
			result.use(Results.json()).from(endereco, "endereco").serialize();
		else
			result.use(Results.json()).from("Cep não encontrado", "endereco").serialize();
	}

}