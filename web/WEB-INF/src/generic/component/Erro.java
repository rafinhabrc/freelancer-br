package generic.component;

import br.com.caelum.vraptor.ioc.ApplicationScoped;
import br.com.caelum.vraptor.ioc.Component;

@Component
@ApplicationScoped
public class Erro {

	public void imprimir(String classe, String metodo, Exception e) {
		System.out.println("\nNova Exception");
		System.out.println("--------------");
		System.out.println("Classe:   " + classe);
		System.out.println("Metodo:   " + metodo);
		System.out.println("Erro:     " + e);
		System.out.println("StackTrace: ");
		e.printStackTrace();
	}

}