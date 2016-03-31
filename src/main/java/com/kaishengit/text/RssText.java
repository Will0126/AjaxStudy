package com.kaishengit.text;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class RssText {

    public static void main(String[] args) throws Exception {

        //Post请求
        String url = "添加路径";
        //创建一个客户端
        CloseableHttpClient httpClient = HttpClients.createDefault();
        //创建请求
        HttpPost httpPost = new HttpPost(url);
        //使用list集合传参
        List<NameValuePair> paramList =  new ArrayList<>();
        //new BasicNameValuePair("","");传入键值对，有几个add几个
        paramList.add(new BasicNameValuePair("username","James"));
        //httpPost带参传递
        httpPost.setEntity(new UrlEncodedFormEntity(paramList));

        //发送请求并接收

        HttpResponse httpResponse = httpClient.execute(httpPost);


    }

}
