package hansuo.trainArrival.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import hansuo.trainArrival.entity.UserRole;
import hansuo.trainArrival.mapper.sqlprovider.UserRoleSqlProvider;

public interface UserRoleMapper extends BaseMapper<UserRole> {

	@InsertProvider(type = UserRoleSqlProvider.class, method = "insertAll")
	int insertAll(@Param("list") List<UserRole> users);

	@Insert("insert into user_role (roleId, userId) values(#{roleId}, #{userId})")
	int insertMap(Map<String, Integer> map);

	@Update("update user_role set roleId = #{roleId} where userId = #{userId}")
	int updateRole(Map<String, Integer> map);

	@Delete("delete from user_role where userId = #{userId}")
	int deleteByUserId(int userId);

}
