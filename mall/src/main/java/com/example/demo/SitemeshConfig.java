package com.example.demo;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class SitemeshConfig extends ConfigurableSiteMeshFilter{

	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder)
	{
		builder.addDecoratorPath("*", "/views/common/default.jsp");

//		builder.addExcludedPath("/etc/*");
//		builder.addExcludedPath("/admin/*");
		builder.addExcludedPath("/product/bae*");
		builder.addExcludedPath("/member/jumunQuestWrite*");
		builder.addExcludedPath("/member/proQuestWrite*");
		builder.addExcludedPath("/member/proQuestUpdate*");
		builder.addExcludedPath("/member/reviewWrite*");
		builder.addExcludedPath("/member/reviewUpdate*");
	}
	
}
