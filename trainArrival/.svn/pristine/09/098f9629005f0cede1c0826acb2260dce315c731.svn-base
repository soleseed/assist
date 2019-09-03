package hansuo.trainArrival.test;

import java.util.concurrent.TimeUnit;

public class VolatileTest {

	public static class MyThread extends Thread {
		private boolean stop = false;

		public void stopMe() {
			this.stop = true;
		}

		public void run() {
			System.out.println("thread start");
			int i = 0;
			while (!stop) {
				i++;
				System.out.println(Integer.toHexString(i));
			}
			System.out.println("Stop thread");
		}
	}

	public static void main(String[] args) throws InterruptedException {
		MyThread t = new MyThread();
		t.start();
		TimeUnit.SECONDS.sleep(1);
		t.stopMe();
		TimeUnit.SECONDS.sleep(1);
		System.out.println("thread end");
	}

}
