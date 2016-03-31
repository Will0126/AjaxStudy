package com.kaishengit.web;

import com.kaishengit.util.HttpUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PipedWriter;
import java.io.PrintWriter;

@WebServlet("/readrss.do")
public class RssServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String url = request.getParameter("url");
        String xml = HttpUtil.getText(url);

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/xml;charset=UTF-8");

        PrintWriter out = response.getWriter();
        out.print(xml);
        out.flush();
        out.close();
    }
}
