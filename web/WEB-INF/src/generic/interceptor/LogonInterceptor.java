package generic.interceptor;

import generic.annotation.LogonRequired;
import generic.component.UserSession;
import site.controller.IndexController;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.resource.ResourceMethod;

@Intercepts
public class LogonInterceptor implements Interceptor {

	private Result result;
	private UserSession userSession;

	public LogonInterceptor(Result result, UserSession userSession) {
		this.result = result;
		this.userSession = userSession;
	}

	public boolean accepts(ResourceMethod method) {
		return (method.getMethod().isAnnotationPresent(LogonRequired.class) || method
				.getResource().getType()
				.isAnnotationPresent(LogonRequired.class));
	}

	public void intercept(InterceptorStack stack, ResourceMethod method,
			Object resourceInstance) {

		if (userSession.isLogged()) {
			stack.next(method, resourceInstance);
		} else {
			result.redirectTo(IndexController.class).index();
		}
	}

}