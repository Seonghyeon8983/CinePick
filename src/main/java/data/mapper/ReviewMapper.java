package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.ReviewDto;

@Mapper
public interface ReviewMapper {
    public void insertReview(ReviewDto dto);
    public List<ReviewDto> getReviewsByMovieId(int movieId);
    public ReviewDto getReviewById(int reviewId);
    public void updateReview(ReviewDto dto);
    public void deleteReview(int reviewId);
}