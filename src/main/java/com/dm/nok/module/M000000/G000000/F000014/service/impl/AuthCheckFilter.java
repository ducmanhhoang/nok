/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G000000.F000014.service.impl;

import com.dm.nok.module.M000000.G000000.F000014.service.LoginVO;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;

/**
 *
 * @author Hoang Duc Manh
 */
@Component
public class AuthCheckFilter implements Filter {

    private Logger logger = LoggerFactory.getLogger(AuthCheckFilter.class);

    @Override
    public void init(FilterConfig fc) throws ServletException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain fc) throws IOException, ServletException {
        HttpServletRequest httpReq = (HttpServletRequest) req;
        HttpServletResponse httpRes = (HttpServletResponse) res;
        
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Object authObject = (auth != null) ? auth.getPrincipal() : null;

        WebAuthenticationDetails wad = (WebAuthenticationDetails) auth.getDetails();

        logger.debug("{Remote Host: " + req.getRemoteHost() + ", Remote Address: " + req.getRemoteAddr() + ", Username: " + auth.getName() + ", Password: " + auth.getCredentials() + ", IP Address: " + wad.getRemoteAddress() + ", Session: " + wad.getSessionId() + "}");

        boolean pass = true;

        if (authObject instanceof LoginVO && req != null) {
            pass = true;
        } else {
            pass = true;
        }
        if (!pass) {
            logger.debug("44444444444444444444444444444444444444");
            httpRes.sendError(HttpServletResponse.SC_FORBIDDEN);
        } else {
            logger.debug("55555555555555555555555555555555555555");
            fc.doFilter(httpReq, httpRes);
        }
    }

    @Override
    public void destroy() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
