package data.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import data.dto.VoteDto;

@Mapper
public interface VoteMapper {
    void insertVote(VoteDto dto);
    List<VoteDto> getVotesByPollId(int poll_id);
    void updateVote(VoteDto dto);
    void deleteVote(int vote_id);
}
