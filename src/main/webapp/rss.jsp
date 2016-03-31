<%--
  Created by IntelliJ IDEA.
  User: Will
  Date: 2016/4/1
  Time: 7:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Will</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h3>Rss解析</h3>
        <%--form只是为对其--%>
        <form class="form-inline">
            <input type="text" class="span6" id="url"> <button type="button" id="btn">抓取</button>
        </form>
        <div id="rss">

        </div>
    </div>
    <script>
        (function (){

            //创造
            function createXmlHttp() {
                var xmlhttp = null;
                if(window.ActiveXObject){
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                } else {
                    xmlhttp = new XMLHttpRequest();
                }
                return xmlhttp;
            }

            document.querySelector("#btn").onclick = function() {
                document.querySelector("#rss").innerHTML = null;

                var url = document.querySelector("#url").value;
                var xmlHttp = createXmlHttp();
                xmlHttp.open("get", "/readrss.do?url="+url, true);

                xmlHttp.onreadystatechange = function () {

                    if (xmlHttp.readyState == 4) {
                        if (xmlHttp.status == 200) {
                            //接收返回的xml
                            var xmlDoc = xmlHttp.responseXML;

                            //Rss解析器，这里只解析部分，例如item
                            var itemElements = xmlDoc.getElementsByTagName("item");
                            for(var i = 0;i < itemElements.length;i++) {
                                var itemElement = itemElements[i];
                                var title = itemElement.getElementsByTagName("title")[0].childNodes[0].nodeValue;
                                var link = itemElement.getElementsByTagName("link")[0].childNodes[0].nodeValue;
                                var h4 = document.createElement("h4");
                                var a = document.createElement("a");
                                a.setAttribute("href",link);
                                var text = document.createTextNode(title);
                                a.appendChild(text);
                                h4.appendChild(a);
                                document.querySelector("#rss").appendChild(h4);
                                }
                            } else {
                            alert("ERROR" + xmlHttp.status)
                        }
                    }
                }
            }
        })();
    </script>
</body>
</html>
