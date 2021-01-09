#include <jni.h>
#include <string>

#include <android/log.h>
#include "add_test.h"


#define LOG_TAG "TEST_SO"
#define LOGD(...) __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)

// 声明函数  这个函数是在第三方的so里面已经实现了，我们的cpp来调用它
extern "C" int add_fun(int a, int b);
extern "C" int sub_fun(int a, int b);

//Java层定义的Native方法的具体实现： 返回一个从JNI层的String
extern "C" JNIEXPORT jstring JNICALL
Java_com_example_hellojni_JNIUtils_stringFromJNI(
        JNIEnv *env,
        jobject /* this */) {
    std::string hello = "Hello from C++";
    return env->NewStringUTF(hello.c_str());
}

//Java层定义的Native方法的具体实现： 返回计算两个int类型的加法的运算结果
//这个函数的核心意义就是做一层包装转换，将第三方提供的so里面的不符合jni命名的方法，转换成符合jni命令的方法
extern "C" JNIEXPORT jint JNICALL
Java_com_example_hellojni_JNIUtils_addFunctionFromJNI(
        JNIEnv *env,
        jobject obj,
        jint a, jint b) {
    // 具体调用第三方so里面的实现
    int res = add_fun(a, b);
    LOGD("res= %d", res);
    return res;
}

//Java层定义的Native方法的具体实现： 返回计算两个int类型的减法的运算结果
//这个函数的核心意义就是做一层包装转换，将第三方提供的so里面的不符合jni命名的方法，转换成符合jni命令的方法
extern "C" JNIEXPORT jint JNICALL
Java_com_example_hellojni_JNIUtils_subFunctionFromJNI(
        JNIEnv *env,
        jobject obj,
        jint a, jint b) {
    // 具体调用第三方so里面的实现
    int res = sub_fun(a, b);
    LOGD("res= %d", res);
    return res;
}



