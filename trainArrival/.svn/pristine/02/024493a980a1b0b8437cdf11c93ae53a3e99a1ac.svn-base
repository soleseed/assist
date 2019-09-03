package hansuo.trainArrival.mapper.sqlprovider;

import org.apache.commons.lang.StringUtils;

import hansuo.trainArrival.entity.WebUser;

public class WebUserSqlProvider extends BaseSqlProvider {

	/**
	 * 条件查询语句
	 * 
	 * @param webUser
	 * @return
	 */
	public String searchByConditions(final WebUser webUser) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM WEB_USER A ");
		sql.append(" INNER JOIN  B_DEPT B ON A.DEPTID = B.ID ");
		sql.append(" INNER JOIN B_POST C ON  A.POSTID = C.ID ");
		sql.append(" WHERE 1=1 ");
		if (StringUtils.isNotBlank(webUser.getUserName())) {

			sql.append(" AND A.USERNAME LIKE CONCAT('%', '").append(webUser.getUserName())
					.append("', '%')");
		}
		if (StringUtils.isNotBlank(webUser.getPostName())) {
			sql.append(" AND C.POSTNAME LIKE CONCAT('%', '").append(webUser.getPostName())
					.append("', '%')");
		}
		if (StringUtils.isNotBlank(webUser.getDeptName())) {
			sql.append(" AND B.DEPTNAME LIKE CONCAT('%', '").append(webUser.getDeptName())
					.append("', '%')");
		}
		if (StringUtils.isNotBlank(webUser.getAliases())) {
			sql.append(" AND A.ALIASES LIKE CONCAT('%', '").append(webUser.getAliases())
					.append("', '%')");
		}
		return sql.toString();
	}

}
