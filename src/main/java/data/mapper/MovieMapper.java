package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.MovieDto;

@Mapper
public interface MovieMapper {
    public void insertMovie(MovieDto dto);
    public List<MovieDto> getAllMovies();
    public MovieDto getMovieById(int movie_id);
    public void updateMovie(MovieDto dto);
    public void deleteMovie(int movie_id);
    public MovieDto getMovieByTitle(String title);
}
