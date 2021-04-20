package com.iii.movie.admin.startup;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Component
@PropertySource("classpath:settings.properties")
public class SettingProperties {
	
	@Value("${demo.enable}")
	private String demoEnable;

	public String getDemoEnable() {
		return demoEnable;
	}

	public void setDemoEnable(String demoEnable) {
		this.demoEnable = demoEnable;
	}

}
