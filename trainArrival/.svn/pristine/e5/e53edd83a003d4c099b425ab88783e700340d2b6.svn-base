package hansuo.trainArrival.test;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class TestExecutor {

	private static ScheduledExecutorService es = Executors
			.newScheduledThreadPool(1);

	public static void main(String[] args) {
		Runnable run = new Runnable() {
			private int i = 0;

			@Override
			public void run() {
				// TODO Auto-generated method stub
				i++;
				System.out.println(i);
			}
		};
		es.scheduleAtFixedRate(run, 0, 10, TimeUnit.SECONDS);
	}

}
