package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.MovieDto;

@Mapper
public interface MovieMapper {
    public void insertMovie(MovieDto dto);
    public List<MovieDto> getAllMovies();
    public MovieDto getMovieById(int movieId);
    public void updateMovie(MovieDto dto);
    public void deleteMovie(int movieId);
}
