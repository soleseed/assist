package hansuo.trainArrival.test;

public class HeapAlloc {
	public static void main(String[] args) {
		System.out.println("max memory=" + Runtime.getRuntime().maxMemory() + " bytes");
		System.out.println("free memory=" + Runtime.getRuntime().freeMemory() + " bytes");
		System.out.println("total memory=" + Runtime.getRuntime().totalMemory() + " bytes");

		byte[] b1 = new byte[1 * 1024 * 1024];

		System.out.println("allocate 1M memories to b1");

		System.out.println("max memory=" + Runtime.getRuntime().maxMemory() + " bytes");
		System.out.println("free memory=" + Runtime.getRuntime().freeMemory() + " bytes");
		System.out.println("total memory=" + Runtime.getRuntime().totalMemory() + " bytes");

		byte[] b2 = new byte[4 * 1024 * 1024];

		System.out.println("allocate 4M memories to b2");
		System.out.println("max memory=" + Runtime.getRuntime().maxMemory() + " bytes");
		System.out.println("free memory=" + Runtime.getRuntime().freeMemory() + " bytes");
		System.out.println("total memory=" + Runtime.getRuntime().totalMemory() + " bytes");

	}
}
