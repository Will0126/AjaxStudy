package com.kaishengit.util;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class HttpUtil {
          //获取html的文本内容
    public static String getText(String url) throws IOException {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        //创建get请求
        HttpGet httpGet = new HttpGet(url);
        //手动添加头部，伪装浏览器
        httpGet.addHeader("User-Agent","Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36");
        //httClient.execute();发送请求，获取httpResponse结果;如果不接收结果，就成了DDOS攻击
        HttpResponse httpResponse = httpClient.execute(httpGet);

        //获取http状态码，判断服务器是否正常响应
        int httpCode = httpResponse.getStatusLine().getStatusCode();
        if(httpCode == 200){
            //通过输入流获取返回内容，为Http
            InputStream in = httpResponse.getEntity().getContent();
            //将http转化字符串
            String html = IOUtils.toString(in);
            //这样就获取到了一个网页内容 http
            return html;
        } else {
            System.out.println("服务器异常");
        }
        return null;
    }

    public static void getInpuStream(String url, OutputStream outputStream) throws IOException {
        //创建一个客户端
        CloseableHttpClient httpClient = HttpClients.createDefault();
        //创建请求
        HttpGet httpGet = new HttpGet(url);
        //发送请求并获取结果
        HttpResponse httpResponse = httpClient.execute(httpGet);
        //判断http状态码，看服务器是否正常响应
        if (httpResponse.getStatusLine().getStatusCode() == 200){
            //接收文件,使用流获取
            InputStream inputStream = httpResponse.getEntity().getContent();
            //输出文件，获取输出流
            //使用IOUtils.copy输出文件
            IOUtils.copy(inputStream,outputStream);
            //刷新关闭
            outputStream.flush();
            outputStream.close();
            inputStream.close();
        } else {
            //手动抛出异常
            throw new RuntimeException("HTTP请求错误：" + httpResponse.getStatusLine().getStatusCode());
        }
    }

}
