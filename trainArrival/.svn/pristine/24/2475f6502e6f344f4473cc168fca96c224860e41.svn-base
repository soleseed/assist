package hansuo.trainArrival.test;

import java.util.List;
import java.util.Vector;
import java.util.concurrent.LinkedBlockingQueue;

public class Biased {

	public static List<Integer> numberList = new Vector<Integer>();

	public static void main(String[] args) throws InterruptedException {
//		long begin = System.currentTimeMillis();
//
//		int count = 0;
//		int startNum = 0;
//		while (count < 10000000) {
//			numberList.add(startNum);
//			startNum += 2;
//			count++;
//		}
//
//		long end = System.currentTimeMillis();
//		System.out.println(end - begin);

		LinkedBlockingQueue<String> queue = new LinkedBlockingQueue<String>();
		queue.put("1");
		queue.put("2");
		queue.put("3");
		queue.put("4");
		System.out.println(queue.take());
		System.out.println(queue.take());
		System.out.println(queue.take());
	}

}
