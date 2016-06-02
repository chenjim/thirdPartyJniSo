#include <jni.h>
#include <string>

#include <android/log.h>
#include "add_test.h"


#define LOG_TAG "TEST_SO"
#define LOGD(...) __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)

extern "C" int add_fun(int a, int b);

extern "C" JNIEXPORT jstring JNICALL
Java_com_example_hellojni_MainActivity_stringFromJNI(
        JNIEnv* env,
        jobject /* this */) {
    std::string hello = "Hello from C++";

    int res = add_fun(1, 2);
    LOGD("res= %d", res);
    return env->NewStringUTF(hello.c_str());
}
