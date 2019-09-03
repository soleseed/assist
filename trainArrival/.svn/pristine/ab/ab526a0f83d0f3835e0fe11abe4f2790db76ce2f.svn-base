package hansuo.trainArrival.test;

import java.util.concurrent.TimeUnit;

public class CanReliveObj {

	public static CanReliveObj obj;

	@Override
	protected void finalize() throws Throwable {
		super.finalize();
		System.out.println("canRelive finalize called");
		obj = this;
	}

	@Override
	public String toString() {
		return "i am canRelive";
	}

	public static void main(String[] args) throws InterruptedException {
		obj = new CanReliveObj();
		obj = null;
		System.out.println("first gc begin");
		System.gc();
		TimeUnit.SECONDS.sleep(10);
		if (obj == null) {
			System.out.println("obj is null");
		} else {
			System.out.println("obj is alive");
		}

		System.out.println("second gc begin");
		obj = null;
		System.gc();
		TimeUnit.SECONDS.sleep(10);
		if (obj == null) {
			System.out.println("obj is null");
		} else {
			System.out.println("obj is alive");
		}
		TimeUnit.SECONDS.sleep(1000);
	}

}
