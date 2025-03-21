package data.service;

import java.util.List;
import org.springframework.stereotype.Service;
import data.dto.CompDto;
import data.dto.MovieDto;
import data.mapper.CompMapper;
import data.mapper.MovieMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CompService {
    private final CompMapper compMapper;
    private final MovieMapper movieMapper;
    
    public void insertComparisonPoll(CompDto dto) {
    	compMapper.insertComp(dto);
    }

    public List<CompDto> getAllComparisonPolls() {
        return compMapper.getAllComp();
    }

    public CompDto getComparisonPollById(int poll_id) {
        return compMapper.getCompById(poll_id);
    }

    public void updateComparisonPoll(CompDto dto) {
    	compMapper.updateComp(dto);
    }

    public void deleteComparisonPoll(int poll_id) {
    	compMapper.deleteComp(poll_id);
    }
    public List<CompDto> getAllCompNames() {
        List<CompDto> polls = compMapper.getAllComp();
        for (CompDto poll : polls) {
            if (poll != null) {
                MovieDto movie1 = movieMapper.getMovieById(poll.getMovie_1_id());
                MovieDto movie2 = movieMapper.getMovieById(poll.getMovie_2_id());
                if (movie1 != null && movie2 != null) {
                    poll.setPollName(movie1.getTitle() + " vs " + movie2.getTitle()+"  투표");
                }
            }
        }
        return polls;
    }
    // 새로운 비교 투표 생성 (영화 ID 두 개로 투표 생성)
    public boolean createComparisonPoll(int movie1Id, int movie2Id) {
        // 두 영화가 존재하는지 확인
        MovieDto movie1 = movieMapper.getMovieById(movie1Id);
        MovieDto movie2 = movieMapper.getMovieById(movie2Id);

        if (movie1 != null && movie2 != null) {
            // 두 영화가 존재하면 투표 생성
            CompDto newPoll = new CompDto();
            newPoll.setMovie_1_id(movie1.getMovie_id());
            newPoll.setMovie_2_id(movie2.getMovie_id());
            newPoll.setPollName(movie1.getTitle() + " vs " + movie2.getTitle() + "  투표");

            // DB에 새로운 투표 저장
            insertComparisonPoll(newPoll);
            return true;
        } else {
            // 영화가 없으면 투표를 만들 수 없음
            return false;
        }
    }
}
