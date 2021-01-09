# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Android.mk 官方文档  https://developer.android.google.cn/ndk/guides/android_mk

#include $(call all-subdir-makefiles)


#此变量表示源文件在开发树中的位置。在上述命令中，构建系统提供的宏函数 my-dir 将返回当前目录（Android.mk 文件本身所在的目录）的路径
LOCAL_PATH := $(call my-dir) 

#声明 CLEAR_VARS 变量，其值由构建系统提供。
#CLEAR_VARS 变量指向一个特殊的 GNU Makefile，后者会为您清除许多 LOCAL_XXX 变量，例如 LOCAL_MODULE、LOCAL_SRC_FILES 和 LOCAL_STATIC_LIBRARIES。
#请注意，GNU Makefile 不会清除 LOCAL_PATH。此变量必须保留其值，
#因为系统在单一 GNU Make 执行上下文（其中的所有变量都是全局变量）中解析所有构建控制文件。在描述每个模块之前，您必须声明（重新声明）此变量。
include $(CLEAR_VARS)    


#LOCAL_MODULE 变量存储您要构建的模块的名称。请在应用的每个模块中使用一次此变量。
#每个模块名称必须唯一，且不含任何空格。构建系统在生成最终共享库文件时，会对您分配给 LOCAL_MODULE 的名称自动添加正确的前缀和后缀。
#注意：如果模块名称的开头已经是 lib，构建系统不会添加额外的 lib 前缀；而是按原样采用模块名称，并添加 .so 扩展名。
#因此，比如原来名为 libfoo.c 的源文件仍会生成名为 libfoo.so 的共享对象文件。此行为是为了支持 Android 平台源文件根据 Android.mk 文件生成的库；所有这些库的名称都以 lib 开头。

#生成名为 libsub_test.so 的库。
LOCAL_MODULE := sub_test


# 列举源文件，以空格分隔多个文件：  LOCAL_SRC_FILES 变量必须包含要构建到模块中的 C 和/或 C++ 源文件列表。
LOCAL_SRC_FILES :=sub_test.c   

LOCAL_PRELINK_MODULE := false  

#LOCAL_MODULE_TAGS := optional  


#帮助系统将一切连接到一起
#BUILD_SHARED_LIBRARY 变量指向一个 GNU Makefile 脚本，该脚本会收集您自最近 include 以来在 LOCAL_XXX 变量中定义的所有信息。此脚本确定要构建的内容以及构建方式。
include $(BUILD_SHARED_LIBRARY)  
  

