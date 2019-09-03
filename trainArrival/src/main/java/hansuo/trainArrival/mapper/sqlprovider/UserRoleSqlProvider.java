package hansuo.trainArrival.mapper.sqlprovider;

import java.text.MessageFormat;
import java.util.List;
import java.util.Map;

import hansuo.trainArrival.entity.UserRole;

public class UserRoleSqlProvider extends BaseSqlProvider {

	public String insertAll(Map map) {
		List<UserRole> users = (List<UserRole>) map.get("list");
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO user_role ");
		sb.append("(roleId, userId) ");
		sb.append("VALUES ");
		MessageFormat mf = new MessageFormat("(#'{'list[{0}].roleId}), #'{'list[{0}].userId})");
		for (int i = 0; i < users.size(); i++) {
			sb.append(mf.format(new Object[] { i }));
			if (i < users.size() - 1) {
				sb.append(",");
			}
		}
		return sb.toString();
	}

}
