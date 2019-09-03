package hansuo.trainArrival.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;

public class ServletListenerRegistrationBean {
	@Autowired
	private RequestListener requestListener;

	@Bean
	public ServletListenerRegistrationBean servletListenerRegistrationBean() {
		ServletListenerRegistrationBean servletListenerRegistrationBean = new ServletListenerRegistrationBean();
		servletListenerRegistrationBean.setRequestListener(requestListener);
		return servletListenerRegistrationBean;
	}

	public RequestListener getRequestListener() {
		return requestListener;
	}

	public void setRequestListener(RequestListener requestListener) {
		this.requestListener = requestListener;
	}

}
