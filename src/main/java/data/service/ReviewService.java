package data.service;

import java.util.List;
import org.springframework.stereotype.Service;
import data.dto.ReviewDto;
import data.mapper.ReviewMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReviewService {
    private final ReviewMapper reviewMapper;

    public void insertReview(ReviewDto dto) {
        reviewMapper.insertReview(dto);
    }

    public List<ReviewDto> getReviewsByMovieId(int movie_id) {
        return reviewMapper.getReviewsByMovieId(movie_id);
    }

    public ReviewDto getReviewById(int review_id) {
        return reviewMapper.getReviewById(review_id);
    }

    public void updateReview(ReviewDto dto) {
        reviewMapper.updateReview(dto);
    }

    public void deleteReview(int review_id) {
        reviewMapper.deleteReview(review_id);
    }
}
