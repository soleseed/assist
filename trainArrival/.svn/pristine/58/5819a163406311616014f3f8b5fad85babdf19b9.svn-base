package hansuo.trainArrival.test.loadclass;

public class PrintClassLoader {

	public void print() {
		int[] intarray = new int[10];
		Object[] objarray = new Object[10];
		int[][] mintarray = new int[10][10];
	}

	public String checkcast(Object obj) {
		float f1 = 9;
		float f2 = 10;
		System.out.println(f1 > f2);
		return null;
	}

	public void switch4(String i) {
		switch (i) {
		case "asd":
			int j = 0;
			break;
		case "asw":
			int k = 0;
			break;
		case "asq":
			int l = 0;
			break;
		default:
			break;
		}
	}

	public void print2(int i) {
		long l = i;
		float f = l;
		int j = (int) l;

	}

	public static void main(String[] args) {
		ClassLoader cl = PrintClassLoader.class.getClassLoader();
		System.out.println(PrintClassLoader.class);
		System.out.println(cl.getSystemClassLoader());
		System.out.println(String.class.getClassLoader());
		while (cl != null) {
			System.out.println(cl);
			cl = cl.getParent();
		}
	}

}
