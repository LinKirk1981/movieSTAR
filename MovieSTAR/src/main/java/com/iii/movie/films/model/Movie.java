package com.iii.movie.films.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.springframework.stereotype.Component;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Component
@Entity
@Table(name = "Movie")
public class Movie {
	@Id
	@Column(name = "MOVIE_ID")
    private Integer movieId;
	@Column(name = "MOVIE_NAME")
    private String movieName;
	@Column(name = "MOVIE_ACTOR")
    private String movieActor;
	@Column(name = "MOVIE_DIRECTOR",columnDefinition = "varchar(MAX)")
    private String movieDirector;
	@Column(name = "MOVIE_TYPE")
    private String movieType;
	@Column(name = "MOVIE_DETAIL",columnDefinition = "varchar(MAX)")
    private String movieDetail;
	@Column(name = "MOVIE_TRAILER",columnDefinition = "varchar(MAX)")
	private String movieTrailer;
	@Column(name = "MOVIE_IMAGE",columnDefinition = "varbinary(MAX)")
    private byte[] movieImage;
	@Column(name = "MOVIE_DATE",columnDefinition = "date")
    private String movieDate;
	@Column(name = "MOVIE_DURATION")
    private String movieDuration;
	@Column(name = "MOVIE_COMPANY")
    private String movieCompany;
	@Column(name = "MOVIE_STATE")
    private Integer movieState;
	@Column(name = "MOVIE_RATING")
	private String movieRating;
    @OneToMany(mappedBy = "movie",cascade = CascadeType.ALL)
    @JsonIgnore
    private List<Schedule> schedules;
    
 
    
	public Movie() {
		
	}
	
	
	public Movie(Integer movieId, String movieName, String movieActor, String movieDirector, String movieType,
			String movieDetail, String movieTrailer, String movieDate, String movieDuration, String movieCompany,
			Integer movieState, String movieRating) {
		this.movieId = movieId;
		this.movieName = movieName;
		this.movieActor = movieActor;
		this.movieDirector = movieDirector;
		this.movieType = movieType;
		this.movieDetail = movieDetail;
		this.movieTrailer = movieTrailer;
		this.movieDate = movieDate;
		this.movieDuration = movieDuration;
		this.movieCompany = movieCompany;
		this.movieState = movieState;
		this.movieRating = movieRating;
	}


	public Movie(Integer movieId, String movieName, String movieActor, String movieDirector, String movieType,
			String movieDetail, String movieTrailer, byte[] movieImage, String movieDate, String movieDuration,
			String movieCompany, Integer movieState, String movieRating) {
		super();
		this.movieId = movieId;
		this.movieName = movieName;
		this.movieActor = movieActor;
		this.movieDirector = movieDirector;
		this.movieType = movieType;
		this.movieDetail = movieDetail;
		this.movieTrailer = movieTrailer;
		this.movieImage = movieImage;
		this.movieDate = movieDate;
		this.movieDuration = movieDuration;
		this.movieCompany = movieCompany;
		this.movieState = movieState;
		this.movieRating = movieRating;
	}




	public Integer getMovieId() {
		return movieId;
	}

	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getMovieActor() {
		return movieActor;
	}

	public void setMovieActor(String movieActor) {
		this.movieActor = movieActor;
	}

	public String getMovieDirector() {
		return movieDirector;
	}

	public void setMovieDirector(String movieDirector) {
		this.movieDirector = movieDirector;
	}

	public String getMovieType() {
		return movieType;
	}

	public void setMovieType(String movieType) {
		this.movieType = movieType;
	}

	public String getMovieDetail() {
		return movieDetail;
	}

	public void setMovieDetail(String movieDetail) {
		this.movieDetail = movieDetail;
	}

	public String getMovieTrailer() {
		return movieTrailer;
	}

	public void setMovieTrailer(String movieTrailer) {
		this.movieTrailer = movieTrailer;
	}

	public byte[] getMovieImage() {
		return movieImage;
	}

	public void setMovieImage(byte[] movieImage) {
		this.movieImage = movieImage;
	}

	public String getMovieDate() {
		return movieDate;
	}

	public void setMovieDate(String movieDate) {
		this.movieDate = movieDate;
	}

	public String getMovieDuration() {
		return movieDuration;
	}

	public void setMovieDuration(String movieDuration) {
		this.movieDuration = movieDuration;
	}

	public String getMovieCompany() {
		return movieCompany;
	}

	public void setMovieCompany(String movieCompany) {
		this.movieCompany = movieCompany;
	}

	public Integer getMovieState() {
		return movieState;
	}

	public void setMovieState(Integer movieState) {
		this.movieState = movieState;
	}


	public String getMovieRating() {
		return movieRating;
	}


	public void setMovieRating(String movieRating) {
		this.movieRating = movieRating;
	}

	public List<Schedule> getSchedules() {
		return schedules;
	}

	public void setSchedules(List<Schedule> schedules) {
		this.schedules = schedules;
	}


	@Override
	public String toString() {
		return "Movie [電影編號=" + movieId + ", 電影名稱=" + movieName + ", 電影類型=" + movieType + ", 電影分級=" + movieRating+ ", 電影日期="
				+ movieDate + ", 電影時長=" + movieDuration  + "]";
	}


	



	
}
