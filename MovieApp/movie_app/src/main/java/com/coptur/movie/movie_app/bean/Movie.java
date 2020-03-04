package com.coptur.movie.movie_app.bean;

import lombok.Data;

import java.util.Date;

@Data
public class Movie {
    private long id;
    private String imgSrc;
    private String name;
    private String score;
    private int heat;
    private String kind;
    private String area;
    private String actor;
    private String actorImg;
    private Date time;

}
