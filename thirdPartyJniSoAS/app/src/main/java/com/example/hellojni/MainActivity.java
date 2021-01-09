package com.example.hellojni;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.TextView;

/**
 * 当前界面使用JNI的方法并显示到界面上
 */
public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        TextView tv = findViewById(R.id.sample_text);
        //调用第一个jni方法，返回一个字符串
        tv.setText(JNIUtils.stringFromJNI());

        int a = 100, b = 60;
        //调用第二个jni方法，计算两个数字求和的结果
        int result = JNIUtils.addFunctionFromJNI(a, b);
        String resultStr = "从JNI获取的计算结果为：" + a + " + " + b + " = " + result;
        TextView tv2 = findViewById(R.id.sample_text2);
        tv2.setText(resultStr);

        //调用第三个jni方法，计算两个数字求差的结果
        int result2 = JNIUtils.subFunctionFromJNI(a, b);
        String resultStr2 = "从JNI获取的计算结果为：" + a + " - " + b + " = " + result2;
        TextView tv3 = findViewById(R.id.sample_text3);
        tv3.setText(resultStr2);
    }
}
