package hansuo.trainArrival.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import hansuo.trainArrival.entity.ScheduleJobEx;

public class ExportUtils {

	public static void exportExcel(List<?> list, String title, String sheetName, Class<?> pojoClass, String fileName,
			boolean isCreateHeader, HttpServletResponse response) {
		ExportParams exportParams = new ExportParams(title, sheetName);
		exportParams.setCreateHeadRows(isCreateHeader);
		defaultExport(list, pojoClass, fileName, response, exportParams);

	}

	private static void defaultExport(List<?> list, Class<?> pojoClass, String fileName, HttpServletResponse response,
			ExportParams exportParams) {
		Workbook workbook = ExcelExportUtil.exportExcel(exportParams, pojoClass, list);
		if (workbook != null)
			downLoadExcel(fileName, response, workbook);
		// testLocal(workbook);

	}

	private static void testLocal(Workbook workbook) {
		try {
			File file = new File("c://test.xls");
			if (!file.exists()) {
				System.out.println(file.getAbsolutePath());
				file.createNewFile();
			}
			OutputStream out = new FileOutputStream(file);
			workbook.write(out);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		List<ScheduleJobEx> list = new ArrayList<>();
		ScheduleJobEx obj1 = new ScheduleJobEx();
		obj1.setIsArrive(0);
		obj1.setTrackName("gudao110");
		obj1.setArriveTime(new Date());
		ScheduleJobEx obj2 = new ScheduleJobEx();
		obj2.setIsArrive(1);
		obj2.setTrackName("gudao111");
		obj2.setArriveTime(new Date());
		list.add(obj1);
		list.add(obj2);
		exportExcel(list, "test", "test", ScheduleJobEx.class, null, true, null);
	}

	private static void downLoadExcel(String fileName, HttpServletResponse response, Workbook workbook) {
		try {
			if (fileName == null) {
				fileName = "调度作业.xls";
			}
			response.setCharacterEncoding("UTF-8");
			response.setHeader("content-Type", "application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
			workbook.write(response.getOutputStream());
		} catch (IOException e) {
			// throw new Exception(e.getMessage());
		}
	}

}
