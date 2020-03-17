>本文主要讲述如何在jni中调用第三方共享so

>项目源码地址：https://github.com/chenjim/thirdPartyJniSo

>本博客地址：http://blog.csdn.net/csqingchen/article/details/51548839

>android studio 中如何使用，参见本项目thirdPartyJniSoAS目录studio工程

### 如何使用

1. 生成第三方共享.so库  

    - 命令行切换到`thirdPartyJniSo/prebuild/`目录下  
    - 执行`ndk-build`在libs目录生成Android平台各种CPU指令集的库

2. Eclise使用
    
    - 命令行切换到`hirdPartyJniSo\thirdPartyJniSoEclipse`,
    - 执行`ndk-build`在libs中生成HelloJni.java需要的.so库  
    - Eclipse打开thirdPartyJniSoEclipse即可
    
3. Android Studio使用

    

4. hello-jni.c中对共享库中函数add_fun的调用，可以将返回结果在其中进一步封装，返回给HelloJni.java使用。  

### 注意问题

1. [gcc 生成的共享动态库](http://blog.csdn.net/csqingchen/article/details/51546784)，android无法使用，必须用ndk编译生成的.so，否则提示".so: File format not recognized"。  
2. 项目中两处Application.mk 中APP_ABI的配置必须相同，否则提示".so: File format not recognized"。  
3. 最终调用的libhello-jni.so也是动态共享库，为啥不直接用`thirdPartyJniSo/prebuild/libs`中的`libadd_test.so`？是因为HelloJni.java只能通过native桥接调用so文件。  

参考文章：

http://blog.csdn.net/educast/article/details/12773127/  

http://tools.android.com/tech-docs/new-build-system/gradle-experimental  

https://github.com/googlesamples/android-ndk/tree/master/hello-libs  

