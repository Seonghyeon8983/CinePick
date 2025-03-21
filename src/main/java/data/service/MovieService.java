package data.service;

import java.util.List;
import org.springframework.stereotype.Service;

import data.dto.MovieDto;
import data.mapper.MovieMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MovieService {
    private final MovieMapper movieMapper;

    public void insertMovie(MovieDto dto) {
        movieMapper.insertMovie(dto);
    }

    public List<MovieDto> getAllMovies() {
        return movieMapper.getAllMovies();
    }

    public MovieDto getMovieById(int movie_id) {
        return movieMapper.getMovieById(movie_id);
    }

    public void updateMovie(MovieDto dto) {
        movieMapper.updateMovie(dto);
    }

    public void deleteMovie(int movie_Id) {
        movieMapper.deleteMovie(movie_Id);
    }
    
    public MovieDto getMovieByTitle(String title) {
        return movieMapper.getMovieByTitle(title);
    }
    
}
