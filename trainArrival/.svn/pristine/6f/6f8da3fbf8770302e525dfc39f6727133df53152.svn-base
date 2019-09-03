package hansuo.trainArrival.test;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.LongAdder;

public class Atomic {

	private static final int max_threads = 3;

	private static final int task_count = 3;

	private static final int target_count = 10000000;

	private AtomicLong acount = new AtomicLong(0l);

	private static LongAdder longAdder = new LongAdder();

	private long count = 0;

	static CountDownLatch cdlsync = new CountDownLatch(task_count);
	static CountDownLatch cdlatomic = new CountDownLatch(task_count);
	static CountDownLatch cdllong = new CountDownLatch(task_count);

	protected synchronized long inc() {
		return ++count;
	}

	protected synchronized long getCount() {
		return count;
	}

	public void clearCount() {
		this.count = 0;
	}

	public class SyncThread implements Runnable {

		protected String name;

		protected long starttime;

		Atomic out;

		public SyncThread(Atomic o, long starttime) {
			// TODO Auto-generated constructor stub
			this.out = o;
			this.starttime = starttime;
		}

		public void run() {
			long v = out.getCount();
			while (v < target_count) {
				v = out.inc();
			}
			long endTime = System.currentTimeMillis();
			System.out.println(
					"SyncThread spend " + (endTime - starttime) + "ms,v=" + v);
			cdlsync.countDown();
		}

		public void testSync() throws InterruptedException {
			ExecutorService es = Executors.newFixedThreadPool(max_threads);
			long starttime = System.currentTimeMillis();
			SyncThread syncThread = new SyncThread(this.out, starttime);
			for (int i = 0; i < max_threads; i++) {
				es.submit(syncThread);
			}
			cdlsync.await();
			es.shutdown();
		}

	}

	public class AtomicThread implements Runnable {

		protected String name;

		protected long starttime;

		public AtomicThread(long starttime) {
			this.starttime = starttime;
		}

		@Override
		public void run() {
			// TODO Auto-generated method stub
			long v = acount.get();
			while (v < target_count) {
				v = acount.incrementAndGet();
			}
			long endtime = System.currentTimeMillis();
			System.out.println("AtomicThread spend " + (endtime - starttime)
					+ "ms,v=" + v);
			cdlatomic.countDown();
		}

		public void testAtomic() throws InterruptedException {
			ExecutorService es = Executors.newFixedThreadPool(max_threads);
			AtomicThread thread = new AtomicThread(System.currentTimeMillis());
			for (int i = 0; i < max_threads; i++) {
				es.submit(thread);
			}
			cdlatomic.await();
			es.shutdown();
		}
	}

	public static class TestlongAdder implements Runnable {
		private long starttime;

		private String name;

		public TestlongAdder() {
			// TODO Auto-generated constructor stub
		}

		@Override
		public void run() {
			// TODO Auto-generated method stub
			long v = longAdder.sum();
			while (v < target_count) {
				longAdder.increment();
				v = longAdder.sum();
			}
			long endtime = System.currentTimeMillis();
			System.out.println("LongAdderThread spend " + (endtime - starttime)
					+ "ms,v=" + v);
			cdllong.countDown();
		}

		public void testLong() throws InterruptedException {
			ExecutorService es = Executors.newFixedThreadPool(max_threads);
			TestlongAdder thread = new TestlongAdder();
			thread.starttime = System.currentTimeMillis();
			for (int i = 0; i < max_threads; i++) {
				es.submit(thread);
			}
			cdllong.await();
			es.shutdown();
		}
	}

	public static void main(String[] args) throws InterruptedException {
		Atomic atomic = new Atomic();
		SyncThread sync = atomic.new SyncThread(atomic,
				System.currentTimeMillis());
		AtomicThread atomicThread = atomic.new AtomicThread(
				System.currentTimeMillis());
		TestlongAdder testlongAdder = new TestlongAdder();
		sync.testSync();

		atomicThread.testAtomic();

	}

}
