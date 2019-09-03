package hansuo.trainArrival.test.loadclass;

public class InitMain extends Parent {
	// static int c;

//	static {
//		System.out.println("InitMain init");
//		c = 1;
//		i = 19;
//	}

	public InitMain() {
		// TODO Auto-generated constructor stub
	}

	public void testThis() {
		System.out.println(toString());
	}

	public void testSuper() {
		System.out.println(super.toString());
	}

	public synchronized void add() {
		int i = 0;
		i++;
	}

	public void add1() {
		synchronized (this) {
			System.out.println("asd");
		}
	}

	public void testParam(int a) {
		System.out.println(a);
		return;
	}

	public static void testParam1(long a) {
		int b;
		System.out.println(a);
	}

	public String toString() {
		return "this string,not super string";
	}

	public static void main(String[] args) {
		// Children c = new Children();
		InitMain i = new InitMain();
		System.out.println(Children.i);
		i.testThis();
		i.testSuper();
	}
}
