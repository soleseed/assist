package hansuo.trainArrival.mapper.sqlprovider;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.ArrayUtils;

public class BaseSqlProvider {

	private static final String SKIP_UID = "serialVersionUID";

	private static final String SKIP_ID = "id";

	public String insert(Object bean) {
		Class<?> beanClass = bean.getClass();
		String tableName = getTableName(beanClass);
		Field[] fields = getFields(beanClass);
		StringBuilder insertSql = new StringBuilder();
		List<String> insertParas = new ArrayList<String>();
		List<String> insertParaNames = new ArrayList<String>();
		insertSql.append("INSERT INTO ").append(tableName).append("(");
		try {
			for (int i = 0; i < fields.length; i++) {
				Field field = fields[i];
				field.setAccessible(true);
				// 跳过序列UID和主键id
				if (SKIP_UID.equals(field.getName()) || SKIP_ID.equals(field.getName())) {
					continue;
				}
				Object object = field.get(bean);
				if (object != null) {
					insertParaNames.add(field.getName());
					insertParas.add("#{" + field.getName() + "}");
				}
			}
		} catch (Exception e) {
			new RuntimeException("get insert sql is exceptoin:" + e);
		}
		for (int i = 0; i < insertParaNames.size(); i++) {
			insertSql.append(insertParaNames.get(i));
			if (i != insertParaNames.size() - 1)
				insertSql.append(",");
		}
		insertSql.append(")").append(" VALUES(");
		for (int i = 0; i < insertParas.size(); i++) {
			insertSql.append(insertParas.get(i));
			if (i != insertParas.size() - 1)
				insertSql.append(",");
		}
		insertSql.append(")");
		return insertSql.toString();
	}

	public String update(Object bean) {
		Class<?> beanClass = bean.getClass();
		String tableName = getTableName(beanClass);
		Field[] fields = getFields(beanClass);
		String id = "";
		StringBuilder updateSql = new StringBuilder();
		updateSql.append(" update ").append(tableName).append(" set ");
		try {
			for (int i = 0; i < fields.length; i++) {
				Field field = fields[i];
				field.setAccessible(true);
				// 跳过序列UID和主键id
				if (SKIP_UID.equals(field.getName()))
					continue;
				if (SKIP_ID.equals(field.getName())) {
					Object value = field.get(bean);
					id = value.toString();
					continue;
				}
				Object beanValue = field.get(bean);
				if (beanValue != null) {
					updateSql.append(field.getName()).append("=#{").append(field.getName()).append("}");
					if (i <= fields.length - 1) {
						updateSql.append(",");
					}
				}
			}
		} catch (Exception e) {
			new RuntimeException("get update sql is exceptoin:" + e);
		}
		updateSql.append(" id = ").append(id).append(" where id = ").append(id);
		return updateSql.toString();
	}

	public String delete(Object bean) {
		Class<?> beanClass = bean.getClass();
		String tableName = getTableName(beanClass);
		Field[] fields = getFields(beanClass);
		String id = "";
		StringBuilder deleteSql = new StringBuilder();
		deleteSql.append(" delete from ").append(tableName).append(" where id = ");
		try {
			for (int i = 0; i < fields.length; i++) {
				Field field = fields[i];
				field.setAccessible(true);
				if (field.getName().equals("id")) {
					Object value = field.get(bean);
					id = value.toString();
				}
			}
			deleteSql.append(id);
		} catch (Exception e) {
			new RuntimeException("get delete sql is exceptoin:" + e);
		}
		return deleteSql.toString();
	}

	/*
	 * public String getById(Object bean) { Class<?> beanClass = bean.getClass();
	 * String tableName = getTableName(beanClass); Field[] fields =
	 * getFields(beanClass); String id = ""; StringBuilder selectSql = new
	 * StringBuilder(); List<String> selectParaNames = new ArrayList<String>(); //
	 * List<String> selectParas = new ArrayList<String>();
	 * selectSql.append("select "); try { for (int i = 0; i < fields.length; i++) {
	 * Field field = fields[i]; field.setAccessible(true); // 跳过序列UID和主键id if
	 * (SKIP_UID.equals(field.getName())) { continue; }
	 * 
	 * if (SKIP_ID.equals(field.getName())) { Object value = field.get(bean); id =
	 * value.toString(); } Object object = field.get(bean);
	 * selectSql.append(field.getName()); if (object != null) {
	 * selectParaNames.add(field.getName()); // selectParas.add("#{" +
	 * field.getName() + "}"); } if (i != fields.length - 1) selectSql.append(",");
	 * } } catch (Exception e) { new RuntimeException("get select sql is exceptoin:"
	 * + e); }
	 * selectSql.append(" from ").append(tableName).append(" where id = ").append(id
	 * ); return selectSql.toString(); }
	 */

	private String getTableName(Class<?> beanClass) {
		return camel2Underline(beanClass.getSimpleName());
	}

	/**
	 * 驼峰转下划线方式
	 * 
	 * @param line
	 * @return
	 */
	private String camel2Underline(String line) {
		if (line == null || "".equals(line)) {
			return "";
		}
		line = String.valueOf(line.charAt(0)).toUpperCase().concat(line.substring(1));
		StringBuffer sb = new StringBuffer();
		Pattern pattern = Pattern.compile("[A-Z]([a-z\\d]+)?");
		Matcher matcher = pattern.matcher(line);
		while (matcher.find()) {
			String word = matcher.group();
			sb.append(word.toUpperCase());
			sb.append(matcher.end() == line.length() ? "" : "_");
		}
		return sb.toString();
	}

	private Field[] getFields(Class<?> beanClass) {
		Field[] beanFields = beanClass.getDeclaredFields();
		Class<?> beanSuperClass = beanClass.getSuperclass();
		Field[] beanSuperFields = beanSuperClass.getDeclaredFields();
		return (Field[]) ArrayUtils.addAll(beanFields, beanSuperFields);
	}
}
