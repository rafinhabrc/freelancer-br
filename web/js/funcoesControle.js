function cadastrarUsuario() {
	$("#container").waitMe({effect :'ios', text :'', bg :'rgba(255,255,255,0.5)', color :'#000', sizeW :'', sizeH :''});
	$("#container").load(caminhoAbsoluto + "usuario/cadastrar");
}
function cadastrarServicos() {
	$("#container").waitMe({effect :'ios', text :'', bg :'rgba(255,255,255,0.5)', color :'#000', sizeW :'', sizeH :''});
	$("#container").load(caminhoAbsoluto + "servicos/cadastrar");
}
function meusServicos() {
	$("#container").waitMe({effect :'ios', text :'', bg :'rgba(255,255,255,0.5)', color :'#000', sizeW :'', sizeH :''});
	$("#container").load(caminhoAbsoluto + "servicos/lista");
}
function meuPerfil() {
	$("#container").waitMe({effect :'ios', text :'', bg :'rgba(255,255,255,0.5)', color :'#000', sizeW :'', sizeH :''});
	$("#container").load(caminhoAbsoluto + "usuario/consultar");
}
function pesquisar(categoria){
	$("#container").waitMe({effect :'ios', text :'', bg :'rgba(255,255,255,0.5)', color :'#000', sizeW :'', sizeH :''});
	$("#container").load(caminhoAbsoluto + "pesquisar", {categoria : categoria, filtro : null});
}
function paginaLogin(){
	$("#container").waitMe({effect :'ios', text :'', bg :'rgba(255,255,255,0.5)', color :'#000', sizeW :'', sizeH :''});
	$("#container").load(caminhoAbsoluto + "paginaLogin");
}