package generic.component;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;

import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class Imagem {

	private File pastaImagens;
	private final HttpServletRequest request;
	
	public Imagem (HttpServletRequest request) {
		this.request = request;
	}
	
	public void salvar(UploadedFile imagem, String nomeDiretorio, String nomePasta) {
		String caminho1 = request.getSession().getServletContext().getRealPath("/imagens/" + nomeDiretorio);
		
		if (!new File(caminho1).exists())
			(new File(caminho1)).mkdir();
		
		String caminho2 = caminho1 + nomePasta;
		
		if (!new File(caminho2).exists())
			(new File(caminho2)).mkdir();
		
		pastaImagens = new File(caminho2);
		
		File destino = new File(pastaImagens, imagem.getFileName());

		try {
			IOUtils.copy(imagem.getFile(), new FileOutputStream(destino));
		} catch (IOException e) {
		  throw new RuntimeException("Erro ao copiar imagem", e);
		}
	}
}
