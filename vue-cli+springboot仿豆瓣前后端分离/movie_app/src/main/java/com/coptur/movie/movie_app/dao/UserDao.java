package com.coptur.movie.movie_app.dao;

import com.coptur.movie.movie_app.bean.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {

    User find(User condition);
}
