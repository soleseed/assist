package hansuo.trainArrival.test;

public class JvmC1 {

	private static int count = 0;

	public static void recursion() {
		count++;
		recursion();
	}

	public static void main(String[] args) {
		for (int i = 0; i < args.length; i++) {
			System.out.println("args" + (i + 1) + ":" + args[i]);
		}
		System.out.println("-Xmx" + Runtime.getRuntime().maxMemory() / 1000 / 1000 + "M");

		try {
			recursion();

		} catch (Throwable e) {
			System.out.println("deep of calling = " + count);
			e.printStackTrace();
		}
	}
}
