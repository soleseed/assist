package hansuo.trainArrival.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import hansuo.trainArrival.entity.Track;

public interface TrackMapper {

	/**
	 * 查询某种状态的股道 <br>
	 * TODO：deptId暂时无用
	 * 
	 * @param status
	 * @return
	 */
	@Select("select id, trackName from b_track where status = #{status}")
	List<Track> getTracks(@Param("status") int status, @Param("deptId") int deptId);

	@Select("select * from b_track where id = #{id}")
	Track getById(int id);

}
