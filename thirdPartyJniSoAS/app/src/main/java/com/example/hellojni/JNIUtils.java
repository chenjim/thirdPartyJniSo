package com.example.hellojni;

/**
 * 定义一个JNI工具类 来做JNI操作
 */
public class JNIUtils {
    // Used to load the 'native-lib' library on application startup.
    static {
        System.loadLibrary("native-lib");
    }

    /**
     * A native method that is implemented by the 'native-lib' native library,
     * which is packaged with this application.
     */
    public static native String stringFromJNI();

    public static native int addFunctionFromJNI(int a, int b);
}
