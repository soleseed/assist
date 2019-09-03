package hansuo.trainArrival.test;

import hansuo.trainArrival.entity.WebUser;

/**
 * JDK1.6 常量池在永久区 <br>
 * JDK1.7 常量池在堆中管理 <br>
 * JDK1.8 常量池在元空间，和堆相互独立
 * 
 * @author Administrator
 *
 */

public class TestString {

	// 输出结果为：true。原因很简单，"hello"+2在编译期间就已经被优化成"hello2"，因此在运行期间，变量a和变量b指向的是同一个对象。
	public void q1() {
		String a = "hello2";
		String b = "hello" + 2;
		System.out.println(a == b);
	}

	// 输出结果为:false。由于有符号引用的存在，所以 String c = b +
	// 2;不会在编译期间被优化，不会把b+2当做字面常量来处理的，因此这种方式生成的对象事实上是保存在堆上的。因此a和c指向的并不是同一个对象
	public void q2() {
		String a = "hello2";
		String b = "hello";
		String c = b + 2;
		System.out.println(a == c);
	}

	// 输出结果为：true。对于被final修饰的变量，会在class文件常量池中保存一个副本，也就是说不会通过连接而进行访问，
	// 对final变量的访问在编译期间都会直接被替代为真实的值。那么String c = b + 2
	// 在编译期间就会被优化成：String c = "hello" + 2;
	public void q3() {
		String a = "hello2";
		final String b = "hello";
		String c = b + 2;
		System.out.println(a == c);
	}

	public void q4() {
		String a = "hello2";
		final String b = getHello();
		String c = b + 2;
		System.out.println(a == c);
	}

	public void q5() {
		String str1 = "hello";
		String str2 = "hello";
		str1 += "world" + "!";
		str2 = str2 + "world" + "!";
	}

	private String getHello() {
		return "hello";
	}

	public static void main(String[] args) {
		WebUser user = new WebUser();
		user.setId(1);
		String str2 = "abc";
		String str1 = "abc";
		String s1 = new String("abc");
		String s2 = new String("abc");

		System.err.println(user.getId());
		System.out.println(str1 == str2);
		System.out.println(s1 == s2);
		System.out.println(s1 == s2.intern());
		System.out.println(s1.intern() == s2.intern());
	}

}
