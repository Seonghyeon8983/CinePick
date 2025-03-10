package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.VoteDto;

@Mapper
public interface VoteMapper {
    public void insertVote(VoteDto dto);
    public List<VoteDto> getVotesByMovieId(int movieId);
    public void updateVote(VoteDto dto);
    public void deleteVote(int voteId);
}