package hansuo.trainArrival.common;

import java.util.HashMap;
import java.util.Map;

public class Common {

	public static final Map<Integer, String> DEPT = new HashMap<Integer, String>();

	public static final Map<String, Integer> POST = new HashMap<String, Integer>();

	public static final Map<Integer, String> FEEDBACK_TYPE = new HashMap<Integer, String>();

	public static final Map<String, Boolean> AUDIO_TRRIGER = new HashMap<>();

	static {
		DEPT.put(0, "车站");
		DEPT.put(1, "场1");
		DEPT.put(2, "场2");

		POST.put("系统管理员", 8);
		POST.put("内勤助理", 1);
		POST.put("车号", 2);
		POST.put("货检", 3);
		POST.put("列检", 4);
		POST.put("防溜", 5);
		POST.put("列尾", 6);
		POST.put("安全作业指挥中心", 7);

		FEEDBACK_TYPE.put(1, "列检作业接收时分");
		FEEDBACK_TYPE.put(2, "商检作业接收时分");
		FEEDBACK_TYPE.put(3, "车号作业接收时分");
		FEEDBACK_TYPE.put(4, "防溜作业接收时分");
		FEEDBACK_TYPE.put(5, "列尾作业接收时分");
		FEEDBACK_TYPE.put(6, "列检作业反馈时分");
		FEEDBACK_TYPE.put(7, "商检作业反馈时分");
		FEEDBACK_TYPE.put(8, "车号作业反馈时分");
		FEEDBACK_TYPE.put(9, "防溜作业反馈时分");
		FEEDBACK_TYPE.put(10, "列尾作业反馈时分");
	}

}
