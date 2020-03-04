package com.coptur.movie.movie_app.service;

import com.coptur.movie.movie_app.bean.User;
import com.coptur.movie.movie_app.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public User find(User condition){
        return userDao.find(condition);
    }

}
