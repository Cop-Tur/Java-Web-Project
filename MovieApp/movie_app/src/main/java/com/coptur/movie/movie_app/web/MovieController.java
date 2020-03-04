package com.coptur.movie.movie_app.web;

import com.coptur.movie.movie_app.bean.Movie;
import com.coptur.movie.movie_app.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class MovieController {
    @Autowired
    private MovieService movieService;

    @CrossOrigin
    @PostMapping("/findall")
    public List<Movie> findAll(){
        List<Movie> movieList=movieService.findAll();
        return movieList;
    }

    @CrossOrigin
    @PostMapping("/updatemovie")
    public String updateMovie(@RequestBody Movie movie){
        System.out.println(movie.toString());
        movieService.updateMovie(movie);
        return "success";
    }

    @CrossOrigin
    @PostMapping("/deletemovie")
    public String deleteMovie(@RequestBody Movie movie){
        System.out.println(movie.toString());
        movieService.deleteMovie(movie);
        return "success";
    }

}
