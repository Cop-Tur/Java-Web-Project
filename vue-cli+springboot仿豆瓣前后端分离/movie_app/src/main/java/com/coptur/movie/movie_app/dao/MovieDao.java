package com.coptur.movie.movie_app.dao;

import com.coptur.movie.movie_app.bean.Movie;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MovieDao {
    List<Movie> findAll();
    void addMovie(Movie movie);
    void deleteMovie(Movie condition);
    void updateMovie(Movie movie);
}
