package site.controller;

import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;
import static org.hamcrest.Matchers.startsWith;
import generic.component.Blowfish;
import generic.component.Erro;
import generic.component.Imagem;
import generic.component.UserSession;

import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;

import site.bean.Contratante;
import site.bean.Freelancer;
import site.bean.FreelancerHabilidades;
import site.bean.Habilidades;
import site.bean.Usuario;
import site.dao.DaoContratante;
import site.dao.DaoFisico;
import site.dao.DaoFreelancer;
import site.dao.DaoFreelancerHabilidades;
import site.dao.DaoHabilidades;
import site.dao.DaoJuridico;
import site.dao.DaoUsuario;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.core.Localization;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.validator.Validations;
import br.com.caelum.vraptor.view.Results;

@Resource
@Path("usuario/")
public class UsuarioController {

	private final Blowfish blowfish;
	private final DaoContratante daoContratante;
	private final DaoFisico daoFisico;
	private final DaoFreelancer daoFreelancer;
	private final DaoFreelancerHabilidades daoFreelancerHabilidades;
	private final DaoJuridico daoJuridico;
	private final DaoHabilidades daoHabilidades;
	private final DaoUsuario daoUsuario;
	private final Erro erro;
	private final Localization localization;
	private final Imagem imagem;
	private final Result result;
	private final UserSession userSession;
	private final Validator validator;

	public UsuarioController(Blowfish blowfish, DaoContratante daoContratante, DaoFisico daoFisico, DaoFreelancer daoFreelancer, DaoFreelancerHabilidades daoFreelancerHabilidades, 
			DaoHabilidades daoHabilidades,DaoJuridico daoJuridico, DaoUsuario daoUsuario, Erro erro, Localization localization, Imagem imagem, Result result, 
			UserSession userSession, Validator validator) {
		this.blowfish = blowfish;
		this.daoContratante = daoContratante;
		this.daoFisico = daoFisico;
		this.daoFreelancer = daoFreelancer;
		this.daoFreelancerHabilidades = daoFreelancerHabilidades;
		this.daoJuridico = daoJuridico;
		this.daoHabilidades = daoHabilidades;
		this.daoUsuario = daoUsuario;
		this.erro = erro;
		this.localization = localization;
		this.imagem = imagem;
		this.result = result;
		this.userSession = userSession;
		this.validator = validator;
	}
	
	@Path("consultar")
	public void consultarUsuario() {
		Usuario usuario = daoUsuario.buscar(userSession.getUsuario().getId());
		
		result.include("usuario", usuario);
	}
	
	@Path("informacoesUsuario")
	public void informacoesUsuario() {
		Usuario usuario = daoUsuario.buscar(userSession.getUsuario().getId());
		
		result.include("usuario", usuario);
		result.include("caminhoImagem", "/imagens/" + userSession.getUsuario().getEmail() + "/perfil");
	}
	
	@Path("informacoesAdicionais")
	public void informacoesAdicionais() {
		Usuario usuario = daoUsuario.buscar(userSession.getUsuario().getId());
		
		result.include("usuario", usuario);
		result.include("habilidadeList", daoHabilidades.listarTudo("descricao", "ASC"));
	}
	
	@Post("gravar")
	public void gravarUsuario(Usuario usuario, String tipoUsuario, String tipoPerfil) {
		try {
			if (usuario.getId() == null) {
				
				if(tipoUsuario.equals("fisico"))
					daoFisico.adicionar(usuario.getFisico());
				else
					daoJuridico.adicionar(usuario.getJuridico());
				
				if(tipoPerfil.equals("freelancer")){
					Freelancer freelancer = new Freelancer();
					
					daoFreelancer.adicionar(freelancer);
					
					usuario.setFreelancer(freelancer);
				} else {
					Contratante contratante = new Contratante();
					
					daoContratante.adicionar(contratante);
					
					usuario.setContratante(contratante);
				}
				
				usuario.setDataCadastro(new GregorianCalendar(TimeZone.getTimeZone("GMT-3"), new Locale("pt", "BR")));
				usuario.setPassword(blowfish.encryptString(usuario.getPassword()));
				usuario.setAtivo(true);
				
				if(usuario.getNomeVisualizacao() == null)
					usuario.setNomeVisualizacao(usuario.getEmail());
				
				daoUsuario.adicionar(usuario);
				
				userSession.logon(usuario);
			} else {
				daoUsuario.atualizar(usuario);
				
				userSession.logon(usuario);
			}
		} catch (Exception e) {
			result.include("mensagem", "usuario.gravar.erro");
			erro.imprimir(this.getClass().getName(), "gravar" ,e);
		}
		result.nothing();
	}
	
	@Post("gravar/infoAdicionais")
	public void gravarInfoAdicionais(Contratante contratante, Freelancer freelancer, Long[] habilidadeList, Usuario usuario, String nomeVisualizacao, final UploadedFile file) {
		try {
			if(freelancer.getId() != null){
				
				daoFreelancer.atualizar(freelancer);
				
				daoFreelancerHabilidades.limparHabilidades(freelancer.getId());
				
				for(Long idHabilidade : habilidadeList){
					Boolean existeHabilidade = daoFreelancerHabilidades.verificaHabilidade(idHabilidade);
					
					if(!existeHabilidade){
						FreelancerHabilidades freelancerHabilidades = new FreelancerHabilidades();
						
						Habilidades habilidades = daoHabilidades.buscar(idHabilidade);
						
						freelancerHabilidades.setFreelancer(freelancer);
						freelancerHabilidades.setHabilidades(habilidades);
						
						daoFreelancerHabilidades.adicionar(freelancerHabilidades);
					}
				}
			} else
				daoContratante.atualizar(contratante);
			
			if(usuario.getId() != null){
				usuario = daoUsuario.buscar(usuario.getId());
				
				usuario.setNomeVisualizacao(nomeVisualizacao);
				
				if (file != null) {
					validator.checking(new Validations() {{
						if (that(file, is(notNullValue()), "imagem", "imagem.nula"))
							that(file.getContentType(), startsWith("image"), "imagem", "nao.eh.imagem");
				    }});
					
					validator.onErrorRedirectTo(ServicosController.class).formServico(null);
					
				    imagem.salvar(file, userSession.getUsuario().getEmail(), "/perfil");
				    
				    usuario.setFoto(file.getFileName());
				}
				
				daoUsuario.atualizar(usuario);
				
				userSession.logon(usuario);
				
				result.redirectTo(SiteController.class).principal(false);
			}
		} catch (Exception e) {
			result.include("mensagem", "usuario.gravar.erro");
			erro.imprimir(this.getClass().getName(), "gravar" ,e);
		}
		
		result.nothing();
	}
	
	@Post("alterarSenha")
	public void alterarSenha(String senhaAtual, String senhaNova) {
		Usuario usuario = userSession.getUsuario();

		if (senhaAtual.equals(blowfish.decryptString(usuario.getPassword()))) {
			try {
				usuario.setPassword(blowfish.encryptString(senhaNova));

				daoUsuario.atualizar(usuario);

				result.include("mensagem", "Senha Alterada com Sucesso");
			} catch (Exception e) {
				result.use(Results.http()).body(localization.getMessage("usuario.alterarSenha.erro"));
				erro.imprimir(this.getClass().getName(), "alterarSenha" ,e);
			}
		} else 
			result.include("mensagem", "Senha Atual Não Corresponde");
		
		result.nothing();
	}
	
	@Post("validarEmail")
	public void validarEmail(String email) {
		Boolean emailDisponivel = false;

		if (daoUsuario.buscarPorEmail(email) == null)
			emailDisponivel = true;
		
		result.use(Results.http()).body(emailDisponivel.toString());
	}
}