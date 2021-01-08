# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.
#CMake版本信息
cmake_minimum_required(VERSION 3.4.1)

# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds them for you.
# Gradle automatically packages shared libraries with your APK.


#STATIC：静态库，是目标文件的归档文件，在链接其它目标的时候使用。
#SHARED：动态库，会被动态链接，在运行时被加载。
#MODULE：模块库，是不会被链接到其它目标中的插件，但是可能会在运行时使用dlopen-系列的函数动态链接。

#设置第三方库  动态方式加载
add_library(
        # 库名字
        libadd_test_pre

        # 库类型
        SHARED

        #IMPORTED: 表示只需要导入，不需要构建so库。
        IMPORTED)

# 设置第三方so库的路径   引入libadd_test.so文件
set_target_properties(
        # 库名字
        # Specifies the target library.
        libadd_test_pre

        # Specifies the parameter you want to define.
        # import so库
        PROPERTIES IMPORTED_LOCATION

        #第三方库的so路径
        #可以使用 ANDROID_ABI 路径变量，将多个 ABI 版本的库添加到你的 CMake 构建脚本中。
        # Provides the path to the library you want to import.

        # ${CMAKE_CURRENT_SOURCE_DIR} 路径路径为：    src\main\cpp\CMakeLists.txt
        # ${ANDROID_ABI} 路径变量  arm64-v8a/armeabi-v7a/x86/x86-64 等
        ${CMAKE_CURRENT_SOURCE_DIR}/../jniLibs/${ANDROID_ABI}/libadd_test.so)


#设置本地库  指定将源码文件native-lib.cpp编译成共享库，名字为：native-lib
add_library(
        # 库名字
        # Sets the name of the library.
        native-lib

        # 库类型
        # Sets the library as a shared library.
        SHARED

        # 包含的cpp
        # Provides a relative path to your source file(s).
        native-lib.cpp)

target_include_directories(native-lib PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/include/
        )

# Searches for a specified prebuilt library and stores the path as a
# variable. Because CMake includes system libraries in the search path by
# default, you only need to specify the name of the public NDK library
# you want to add. CMake verifies that the library exists before
# completing its build.

# 找到NDK提供的共享库log，并保存在变量log-lib中   C++日志
find_library( # Sets the name of the path variable.
        log-lib

        # Specifies the name of the NDK library that
        # you want CMake to locate.
        log)

# Specifies libraries CMake should link to your target library. You
# can link multiple libraries, such as libraries you define in this
# build script, prebuilt third-party libraries, or system libraries.

# 将第三方共享库库和你自己编译出来的共享库连接
target_link_libraries(
        # Specifies the target library.
        # 本地so库
        native-lib

        # 第三方so库
        libadd_test_pre

        # Links the target library to the log library
        # included in the NDK.
        ${log-lib})