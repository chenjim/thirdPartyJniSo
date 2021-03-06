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

#include $(call all-subdir-makefiles)

LOCAL_PATH := $(call my-dir) 

include $(CLEAR_VARS)
LOCAL_MODULE    := libadd_test_pre
LOCAL_SRC_FILES :=  ../../prebuild/libs/${TARGET_ARCH_ABI}/libadd_test.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)    
LOCAL_SRC_FILES := hello-jni.c    
LOCAL_MODULE :=  hello-jni    
LOCAL_LDFLAGS := -L$(LOCAL_PATH)
LOCAL_SHARED_LIBRARIES :=libadd_test_pre 
LOCAL_LDLIBS := -ldl -llog
include $(BUILD_SHARED_LIBRARY)    




