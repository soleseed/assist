package hansuo.trainArrival;

import java.util.Properties;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.github.pagehelper.PageHelper;

@SpringBootApplication
@MapperScan("hansuo.trainArrival.mapper")
public class StartUp {

	// 配置mybatis的分页插件pageHelper
	@Bean
	public PageHelper pageHelper() {
		PageHelper pageHelper = new PageHelper();
		Properties properties = new Properties();
		properties.setProperty("offsetAsPageNum", "true");
		properties.setProperty("rowBoundsWithCount", "true");
		properties.setProperty("reasonable", "true");
		// 配置mysql数据库的方言
		properties.setProperty("dialect", "mysql");
		pageHelper.setProperties(properties);
		return pageHelper;
	}

	/**
	 ** 通过添加 Filter 的方式，配置 CORS 规则，并手动指定对哪些接口有效。
	 * 
	 * @return
	 */
//	@Bean
//	public FilterRegistrationBean corsFilter() {
//		UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
//		CorsConfiguration config = new CorsConfiguration();
//		// Access-Control-Allow-Credentials： 可选，用户是否可以发送、处理 cookie
//		config.setAllowCredentials(true);
//		config.addAllowedOrigin("http://localhost:8080");
//		config.addAllowedOrigin("null");
//		// Access-Control-Allow-Headers: 服务器允许使用的字段
//		config.addAllowedHeader("*");
//		// Access-Control-Allow-Methods: 真实请求允许的方法
//		config.addAllowedMethod("*");
//		source.registerCorsConfiguration("/**", config); // CORS拦截路径 配置对所有接口都有效
//		FilterRegistrationBean bean = new FilterRegistrationBean(new CorsFilter(source));
//		bean.setOrder(0);
//		return bean;
//	}

	public static void main(String[] args) {
		SpringApplication.run(StartUp.class, args);
	}
}
