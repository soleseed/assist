package hansuo.trainArrival.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import hansuo.trainArrival.entity.Train;

public interface TrainMapper {

	/**
	 * 查询某种状态的股道
	 * 
	 * @param status
	 * @return
	 */
	@Select("select id, trainNumber from b_train where status = #{status}")
	List<Train> getTrains(@Param("status") int status);

}
