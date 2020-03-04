package com.coptur.movie.movie_app.web;

import com.coptur.movie.movie_app.bean.User;
import com.coptur.movie.movie_app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;

    @CrossOrigin
    @ResponseBody
    @PostMapping("/login")
    public String login(@RequestBody User user){
        User result = userService.find(user);
        System.out.println(user.toString());
        if(result!=null){
            return "login success";
        }
        return "login failed";
    }
}
