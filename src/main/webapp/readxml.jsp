<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <button id="btn" class="btn-primary">同步数据</button>
        <table class="table">
            <thead>
                <th>编号</th>
                <th>名称</th>
                <th>价格</th>
                <th>数量</th>
                <th>作者</th>
            </thead>
            <tbody id="contant">

            </tbody>
        </table>
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

        document.querySelector("#btn").onclick = function(){
            document.querySelector("#contant").innerHTML = null;
            var xmlHttp = createXmlHttp();
            xmlHttp.open("get","/product.xml",true);

            xmlHttp.onreadystatechange =function(){

                if(xmlHttp.readyState == 4){
                    console.log(564);
                    if(xmlHttp.status == 200) {

                        //接收返回的xml
                        var xmlDoc =xmlHttp.responseXML;
                        //从获取的xml分解值
                        var productElements = xmlDoc.getElementsByTagName("product");

                        for(var i = 0; i < productElements.length; i++){
                            console.log(123);

                            var productElemnt = productElements[i];
                            var id = productElemnt.getAttribute("id");
                            var name = productElemnt.getElementsByTagName("name")[0].childNodes[0].nodeValue;
                            var price = productElemnt.getElementsByTagName("price")[0].childNodes[0].nodeValue;
                            var num = productElemnt.getElementsByTagName("num")[0].childNodes[0].nodeValue;
                            var author = productElemnt.getElementsByTagName("author")[0].childNodes[0].nodeValue;
                            addTbody(id,name,price,num,author);
                        }
                    } else {
                        alert("ERROR" + xmlHttp.status)
                    }
                }

            };
            xmlHttp.send();


        };

        function addTbody(id,name,price,num,author){
            //创建标签
            var tr = document.createElement("tr");
            var idtd = document.createElement("td");
            var nametd = document.createElement("td");
            var pricetd = document.createElement("td");
            var numtd = document.createElement("td");
            var authortd = document.createElement("td");
            //创建文本子节点
            var idTextNode = document.createTextNode(id);
            var nameTextNode = document.createTextNode(name);
            var priceTextNode = document.createTextNode(price);
            var numTextNode = document.createTextNode(num);
            var authorTextNode = document.createTextNode(author);

            idtd.appendChild(idTextNode);
            nametd.appendChild(nameTextNode);
            pricetd.appendChild(priceTextNode);
            numtd.appendChild(numTextNode);
            authortd.appendChild(authorTextNode);

            tr.appendChild(idtd);
            tr.appendChild(nametd);
            tr.appendChild(pricetd);
            tr.appendChild(numtd);
            tr.appendChild(authortd);

            document.querySelector("#contant").appendChild(tr);

        }

    })();

</script>
</body>
</html>
