/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G000000.F000014.service.impl;

import com.dm.nok.module.M000000.G000000.F000000.service.impl.EncryptUtil;
import com.dm.nok.module.M000000.G000000.F000014.service.LoginVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;

/**
 *
 * @author Hoang Duc Manh
 */
@Component(value="nokAuthenticationProvider")
public class NokAuthenticationProvider implements AuthenticationProvider {

    private Logger logger = LoggerFactory.getLogger(NokAuthenticationProvider.class);

    @Override
    public Authentication authenticate(Authentication auth) throws AuthenticationException {

        WebAuthenticationDetails wad = (WebAuthenticationDetails) auth.getDetails();

        logger.debug("{Username: " + auth.getName() + ", Password: " + auth.getCredentials() + ", IP Address: " + wad.getRemoteAddress() + ", Session: " + wad.getSessionId() + "}");

        LoginVO login = new LoginVO();
        
            String username = auth.getName();
            String password = (String)auth.getCredentials();
            String passwordMd5 = EncryptUtil.encryptMD5(password).toUpperCase();
            
            
                login.setLoginId(username);
                login.setLoginPwd(passwordMd5);

        try {

            if (username != null && !"".equals(username) && password != null && !"".equals(password)) {
                //loginVO = loginService.loginAction(loginParam, ip, Consts.SYSTEM.SYSTEM_CD);
            } else {
                throw new BadCredentialsException("Please enter your credential!");
            }

            if (login == null) {
                throw new BadCredentialsException("Invalid login!");
            } else {
                //loginService.loginLogSave(loginVO, ip, Consts.SYSTEM.SYSTEM_CD);
                //loginVO = loginService.loginAction(loginVO, ip, Consts.SYSTEM.SYSTEM_CD);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new BadCredentialsException(e.getMessage(), e);
        }

        return new UsernamePasswordAuthenticationToken(login, passwordMd5, AuthorityUtils.createAuthorityList("ROLE_USER"));
    }

    @Override
    public boolean supports(Class<?> type) {
        return true;
    }

}
