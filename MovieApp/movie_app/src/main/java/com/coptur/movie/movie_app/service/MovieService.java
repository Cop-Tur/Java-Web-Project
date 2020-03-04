package com.coptur.movie.movie_app.service;

import com.coptur.movie.movie_app.bean.Movie;
import com.coptur.movie.movie_app.dao.MovieDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MovieService {
    @Autowired
    private MovieDao movieDao;

    public List<Movie> findAll(){
        return movieDao.findAll();
    }

    public void addMovie(Movie movie){
        movieDao.addMovie(movie);
    }

    public void deleteMovie(Movie movie){
        movieDao.deleteMovie(movie);
    }

    public void updateMovie(Movie movie) {
        movieDao.updateMovie(movie); }
}
