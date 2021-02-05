package com.dm.nok.module.M000000.G000000.F000014.service.impl;

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
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;

/**
 * AJAX 요청시 권한 관련 오류가 생기면 redirect 시키는데, AJAX는 HTTP 상태 코드를 이용해서 에러를 확인해야 하므로,
 * redirect 되기전에 상태 코드를 전송하게함.
 *
 * @author Miracle
 *
 */
public class AjaxSessionTimeoutFilter implements Filter {

    private static final Logger logger = LoggerFactory.getLogger(AjaxSessionTimeoutFilter.class);

    /**
     * Default AJAX request Header
     */
    private String ajaxHeader = "AJAX";

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        if (isAjaxRequest(req)) {
            try {
                chain.doFilter(req, res);
            } catch (AccessDeniedException e) {
                res.sendError(HttpServletResponse.SC_FORBIDDEN);
            } catch (AuthenticationException e) {
                res.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            }
        } else {
            chain.doFilter(req, res);
        }
    }

    private boolean isAjaxRequest(HttpServletRequest req) {
        logger.debug("isAjaxRequest : " + req.getHeader(ajaxHeader));
        logger.debug("isAjaxRequest : " + req.getRequestURL());
        logger.debug("Headers : " + req.getHeaderNames().toString());
        logger.debug("request : " + req);
        return req.getHeader(ajaxHeader) != null && req.getHeader(ajaxHeader).equals(Boolean.TRUE.toString());
    }

    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public String getAjaxHeader() {
        return ajaxHeader;
    }

    public void setAjaxHeader(String ajaxHeader) {
        this.ajaxHeader = ajaxHeader;
    }

}
