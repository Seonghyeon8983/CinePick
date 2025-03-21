package data.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import data.dto.CompDto;

@Mapper
public interface CompMapper {
    void insertComp(CompDto dto);
    List <CompDto> getAllComp();
    CompDto getCompById(int pollId);
    void updateComp(CompDto dto);
    void deleteComp(int pollId);
}
