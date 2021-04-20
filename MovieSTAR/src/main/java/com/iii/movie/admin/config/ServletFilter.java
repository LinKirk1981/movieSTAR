package com.iii.movie.admin.config;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iii.movie.admin.model.IMovieMember;



/**
 * Servlet Filter implementation class MysServletFilter
 */
@WebFilter({"/profiles"})
public class ServletFilter extends HttpFilter {


	private static final long serialVersionUID = 1L;

	@Override
	protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = req.getSession();
		IMovieMember imoviemember = (IMovieMember)session.getAttribute("msg0");
		IMovieMember googlemember = (IMovieMember)session.getAttribute("userBean");
		
		if(imoviemember!=null || googlemember!=null) {			
			chain.doFilter(req, res);			
		}else {
			res.sendRedirect(req.getContextPath() + "/login.controller");
			
		}
    }
	

   

	


	

}
