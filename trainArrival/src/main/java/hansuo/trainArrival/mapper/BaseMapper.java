package hansuo.trainArrival.mapper;

import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.UpdateProvider;

import hansuo.trainArrival.mapper.sqlprovider.BaseSqlProvider;

public interface BaseMapper<T> {

	@InsertProvider(type = BaseSqlProvider.class, method = "insert")
	@Options(useGeneratedKeys = true)
	public int insert(T bean);

	@DeleteProvider(type = BaseSqlProvider.class, method = "delete")
	public int delete(T bean);

	@UpdateProvider(type = BaseSqlProvider.class, method = "update")
	public int update(T bean);
}
