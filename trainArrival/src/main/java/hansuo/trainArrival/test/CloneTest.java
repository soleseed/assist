package hansuo.trainArrival.test;

import hansuo.trainArrival.entity.WebUser;

public class CloneTest implements Cloneable {

	private String s = "cloneMan";

	private WebUser user = new WebUser();

	@Override
	public Object clone() throws CloneNotSupportedException {
		return super.clone();
	}

	/*
	 * public String toString() { return this.s + " user" +
	 * user.getId(); }
	 */
	public static void main(String[] args) throws CloneNotSupportedException {
		CloneTest c1 = new CloneTest();
		c1.user.setId(1);

		System.out.println("C1" + c1);

		CloneTest c2 = (CloneTest) c1.clone();
		System.out.println("C2" + c2);

		c2.user.setId(2);

		System.out.println("C1" + c1);
		System.out.println("C2" + c2);
	}
}
