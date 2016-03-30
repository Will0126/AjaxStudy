<%--
  Created by IntelliJ IDEA.
  User: Will
  Date: 2016/3/29
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Will</title>
    <style>
        .error{
            color: red;
        }
        .hide{
            display: none;
        }
    </style>

</head>
<body>
    <input type="text" id="username" /><span class="error hide" id="errorHelp">帐号错误</span>
    <button id="btn">this is btn</button>
<script>
    (function(){
        function createXMLHttp(){
            var xmlHttp = null;
            if(window.ActiveXObject){
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            } else {
                xmlHttp = new XMLHttpRequest();
            }
            return xmlHttp;
        }

        /*get
        document.querySelector("#btn").onclick = function(){
            var xmlHttp = createXMLHttp();
            var msg = document.querySelector("#msg").value;
            msg = encodeURIComponent(msg);

            xmlHttp.open("get","/home.do?msg="+msg +"&_="+new Date().getTime(),true);
            xmlHttp.send();
        }
        */
        /* post
        document.querySelector("#btn").onclick = function() {
            var xmlHttp = createXMLHttp();
            var msg = document.querySelector("msg").value;
            msg = encodeURIComponent(msg);

            xmlHttp.open("post","/home.do",true);
            xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");

            xmlHttp.send("msg="+msg);
            }

        */

        document.querySelector("#btn").onclick = function(){
            var xmlHttp = createXMLHttp();

            var username = document.querySelector("#username").value;
            username = encodeURIComponent(username);

            xmlHttp.open("get","/home.do?username=" +username,true);
            //回调函数
            xmlHttp.onreadystatechange = function(){
                //获取服务器状态码 1初始化2请求中3响应中4响应成功
                var readystate = xmlHttp.readyState;
                if(readystate == 4){
                    //响应成功
                    //获取http状态码
                    var httpCode = xmlHttp.status;
                    if(httpCode == 200) {
                        //获取服务器返回值
                        var value = xmlHttp.responseText;
                        if(value == 0){
                            document.querySelector("#errorHelp").style.display="inline";
                        }

                    } else {
                        alert("服务器异常" + httpCode);
                    }
                }
            };

            xmlHttp.send();

        }








    })();



</script>
</body>
</html>
