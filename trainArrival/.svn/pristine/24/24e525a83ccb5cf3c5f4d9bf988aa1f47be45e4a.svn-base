package hansuo.trainArrival.mapper;

import java.util.List;

import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.UpdateProvider;

import hansuo.trainArrival.entity.UserRole;
import hansuo.trainArrival.entity.WebUser;
import hansuo.trainArrival.mapper.sqlprovider.WebUserSqlProvider;

public interface WebUserMapper extends BaseMapper<WebUser> {

	@Select("SELECT * FROM WEB_USER A INNER JOIN  B_DEPT B ON A.DEPTID = B.ID INNER JOIN B_POST C ON"
			+ "	A.POSTID = C.ID WHERE USERNAME = #{userName} and PASSWORD = #{password}")
	WebUser search(@Param("userName") String userName, @Param("password") String password);

	/**
	 * 条件查询用户
	 * 
	 * @param webUser
	 * @return
	 */
	@SelectProvider(type = WebUserSqlProvider.class, method = "searchByConditions")
	List<WebUser> searchByConditions(WebUser webUser);

	@Select("SELECT * FROM WEB_USER A INNER JOIN  B_DEPT B ON A.DEPTID = B.ID INNER JOIN B_POST C ON"
			+ "	A.POSTID = C.ID WHERE A.id = #{id}")
	WebUser getById(WebUser webUser);

	@Select("SELECT d.Id, d.userName, d.aliases , a.mid, a.menuName, a.parentMenuId,d.status "
			+ "FROM menu a inner join role_menu b on a.id = b.menuId "
			+ "inner join user_role c on b.roleId = c.roleId "
			+ "inner join web_user d on c.userId = d.Id where d.id = #{id}")
	List<UserRole> getUserRoleById(int id);

	/* 修改 */
	@UpdateProvider(type = WebUserSqlProvider.class, method = "update")
	int update(WebUser user);

	@DeleteProvider(type = WebUserSqlProvider.class, method = "delete")
	int delete(WebUser user);

//	@Insert("insert into WEB_USER (userName,password,deptId,postId,status,aliases) values"
//			+ "(#{userName},#{password},#{deptId},#{postId},#{status},#{aliases})")
//	int insert(WebUser webUser);

}
