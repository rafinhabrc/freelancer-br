package site.controller;

import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;
import static org.hamcrest.Matchers.startsWith;
import generic.annotation.LogonRequired;
import generic.component.Blowfish;
import generic.component.Erro;
import generic.component.Imagem;
import generic.component.UserSession;

import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;

import site.bean.Categoria;
import site.bean.Freelancer;
import site.bean.Servicos;
import site.bean.ServicosCategoria;
import site.dao.DaoCategoria;
import site.dao.DaoFreelancer;
import site.dao.DaoServicos;
import site.dao.DaoServicosCategoria;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.validator.Validations;

@LogonRequired
@Resource
@Path("servicos/")
public class ServicosController {

	private final DaoCategoria daoCategoria;
	private final DaoFreelancer daoFreelancer;
	private final DaoServicos daoServicos;
	private final DaoServicosCategoria daoServicosCategoria;
	private final Erro erro;
	private final Imagem imagem;
	private final Result result;
	private final UserSession userSession;
	private final Validator validator;

	public ServicosController (Blowfish blowfish, DaoCategoria daoCategoria,  DaoFreelancer daoFreelancer, DaoServicos daoServicos,
			DaoServicosCategoria daoServicosCategoria, Erro erro, Imagem imagem, Result result, UserSession userSession, Validator validator) {
		this.daoCategoria = daoCategoria;
		this.daoFreelancer = daoFreelancer;
		this.daoServicos = daoServicos;
		this.daoServicosCategoria = daoServicosCategoria;
		this.erro = erro;
		this.imagem = imagem;
		this.result = result;
		this.userSession = userSession;
		this.validator = validator;
	}
	
	@Path("cadastrar")
	public void formServico(Long id) {
		if(id != null){
			result.include("servicos", daoServicos.buscar(id));
		}
		result.include("categoriaList", daoCategoria.listarTudo("descricao", "ASC"));
	}
	
	@Path("lista")
	public void listaServicos() {
		Freelancer freelancer = daoFreelancer.buscar(userSession.getUsuario().getFreelancer().getId());
		
		result.include("servicoList", freelancer.getServicoList());
	}
	
	@Post("gravar")
	public void gravar(Servicos servicos, Long[] categoriaList, final UploadedFile file) {
		try {
			if (servicos.getId() == null){
				
				if (file != null) {
					validator.checking(new Validations() {{
						if (that(file, is(notNullValue()), "imagem", "imagem.nula"))
							that(file.getContentType(), startsWith("image"), "imagem", "nao.eh.imagem");
				    }});
					
					validator.onErrorRedirectTo(ServicosController.class).formServico(null);
					
				    imagem.salvar(file, userSession.getUsuario().getEmail(), "/servicos");
				    
				    servicos.setImagem("/imagens/" + userSession.getUsuario().getEmail() + "/servicos/" + file.getFileName());
				}
				
				servicos.setDataCadastro(new GregorianCalendar(TimeZone.getTimeZone("GMT-3"), new Locale("pt", "BR")));
				servicos.setFreelancer(userSession.getUsuario().getFreelancer());
				
				daoServicos.atualizar(servicos);
				
				daoServicosCategoria.limparCategorias(servicos.getId());
				
				for(Long idCategoria : categoriaList){
					Boolean existeCategoria = daoServicosCategoria.verificaCategoria(idCategoria);
					
					if(!existeCategoria){
						Categoria categoria = daoCategoria.buscar(idCategoria);
						
						ServicosCategoria servicosCategoria = new ServicosCategoria();
						
						servicosCategoria.setCategoria(categoria);
						servicosCategoria.setServicos(servicos);
						
						daoServicosCategoria.adicionar(servicosCategoria);
					}
				}
			} else {				
				Servicos servicosNovo = daoServicos.buscar(servicos.getId());
				
				servicosNovo.setDescricao(servicos.getDescricao());
				servicosNovo.setTitulo(servicos.getTitulo());
				servicosNovo.setValorCombinar(servicos.getValorCombinar());
				servicosNovo.setValorServico(servicos.getValorServico());
				
				if (file != null) {
					validator.checking(new Validations() {{
						if (that(file, is(notNullValue()), "imagem", "imagem.nula"))
							that(file.getContentType(), startsWith("image"), "imagem", "nao.eh.imagem");
				    }});
					
					validator.onErrorRedirectTo(ServicosController.class).formServico(null);
					
				    imagem.salvar(file, userSession.getUsuario().getEmail(), "/servicos");
				    
				    servicosNovo.setImagem(file.getFileName());
				}
				
				daoServicos.atualizar(servicosNovo);
				
				daoServicosCategoria.limparCategorias(servicosNovo.getId());
				
				for(Long idCategoria : categoriaList){
					Boolean existeCategoria = daoServicosCategoria.verificaCategoria(idCategoria);
					
					if(!existeCategoria){
						Categoria categoria = daoCategoria.buscar(idCategoria);
						
						ServicosCategoria servicosCategoria = new ServicosCategoria();
						
						servicosCategoria.setCategoria(categoria);
						servicosCategoria.setServicos(servicosNovo);
						
						daoServicosCategoria.adicionar(servicosCategoria);
					}
				}
			}
			
			result.redirectTo(SiteController.class).principal(true);
		} catch (Exception e) {
			result.include("mensagem", "usuario.gravar.erro");
			erro.imprimir(this.getClass().getName(), "gravar" ,e);
		}
		result.nothing();
	}
	
	@Post("remover")
	public void remover(Servicos servicos, Long id) {
		try {
			servicos = daoServicos.buscar(id);
			
			daoServicos.remover(servicos);
		} catch (Exception e) {
			erro.imprimir(this.getClass().getName(), "gravar" ,e);
		}
		result.nothing();
	}
}