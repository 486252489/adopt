package club.dao;

import club.pojo.Pet;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PetMapper extends BaseMapper<Pet> {

    public List<Pet> listBySqlReturnEntity(@Param("sql")String sql);

}
