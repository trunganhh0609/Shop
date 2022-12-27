package com.project.qlrl.controllers;

import com.project.qlrl.common.JwtUtils;
import com.project.qlrl.models.UserDetailsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

//@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping(value = "/auth")
public class AuthController {
    @Autowired
    AuthenticationManager authenticationManager;
    @Autowired
    private JwtUtils jwtUtils;


    @PostMapping("/login")
    public Map authenticateUser(@RequestBody Map loginRequest) {
//        AjaxResult ajaxResult = new AjaxResult();
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(loginRequest.get("userName"), loginRequest.get("password")));
            SecurityContextHolder.getContext().setAuthentication(authentication);
            String jwt = jwtUtils.generateJwtToken(authentication);
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();


//				List<String> roles = userDetails.getAuthorities().stream()
//						.map(item -> item.getAuthority())
//						.collect(Collectors.toList());
                result.put("Message", "Login successfully !!!");
                result.put("jwt" ,jwt);
                result.put("Data", userDetails.getUser());
        } catch (Exception e) {
            e.printStackTrace();
            result.put("Message", "Login failed !!!");
        }
        return result;
    }
    }
