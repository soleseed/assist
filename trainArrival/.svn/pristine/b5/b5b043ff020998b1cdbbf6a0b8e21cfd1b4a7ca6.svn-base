package hansuo.trainArrival.test;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import groovyjarjarasm.asm.ClassWriter;
import groovyjarjarasm.asm.MethodVisitor;
import groovyjarjarasm.asm.Opcodes;

/*-verbose:class*/
public class UnloadClass implements Opcodes {
	public static void main(String[] args) throws NoSuchMethodException, SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException {
		ClassWriter cw = new ClassWriter(ClassWriter.COMPUTE_MAXS | ClassWriter.COMPUTE_FRAMES);
		cw.visit(V1_7, ACC_PUBLIC, "Example", null, "java/lang/Object", null);
		MethodVisitor mv = cw.visitMethod(ACC_PUBLIC, "<init>", "()V", null, null);
		mv.visitVarInsn(ALOAD, 0);
		mv.visitMethodInsn(INVOKESPECIAL, "java/lang/Object", "<int>", "()V");
		mv.visitInsn(RETURN);
		mv.visitMaxs(0, 0);
		mv.visitEnd();

		mv = cw.visitMethod(ACC_PUBLIC + ACC_STATIC, "main", "([Ljava/lang/String;]V)", null, null);
		mv.visitFieldInsn(GETSTATIC, "java/lang/System", "out", "Ljava/lang/io/PrintStream");
		mv.visitLdcInsn("hello world");
		mv.visitMethodInsn(INVOKEVIRTUAL, "java/lang/PrintStream", "println", "(Ljava/lang/String;)V");
		mv.visitInsn(RETURN);
		mv.visitMaxs(0, 0);
		mv.visitEnd();

		byte[] code = cw.toByteArray();
		for (int i = 0; i < 10; i++) {
			UnloadClass uc = new UnloadClass();
			Method m = ClassLoader.class.getDeclaredMethod("defineClass", String.class, byte[].class, int.class,
					int.class);
			m.setAccessible(true);
			m.invoke(uc, "Example", code, 0, code.length);
			m.setAccessible(false);
			System.gc();
		}
	}
}
