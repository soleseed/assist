package hansuo.trainArrival.test;

/*-XX:+PrintGCTimeStamps -XX:+PrintGCDetails -verbose:gc*/
public class Gctest {

	public void localvarGc1() {
		byte[] a = new byte[6 * 1024 * 1024];
		System.gc();
	}

	public void localvarGc2() {
		byte[] a = new byte[6 * 1024 * 1024];
		a = null;
		System.gc();
	}

	public void localvarGc3() {
		{

			byte[] a = new byte[6 * 1024 * 1024];
		}
		System.gc();
	}

	public void localvarGc4() {
		{

			byte[] a = new byte[6 * 1024 * 1024];
		}
		int c = 10;
		System.gc();
	}

	public void localvarGc5() {
		localvarGc1();
		System.gc();
	}

	public static void main(String[] args) {
		Gctest gc = new Gctest();
		gc.localvarGc4();

	}

}
