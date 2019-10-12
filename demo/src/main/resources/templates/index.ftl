<html lang="ch">
<head>
    <meta charset="utf-8" />
    <title></title>
</head>
<body>
<div>发送消息</div>
<input type="text" id="msgContent" />
<input type="button" value="点我发送" onclick="CHAT.chat()" />

<div>接收消息：</div>
<div id="receiveMsg" style="background: gray;"></div>


<script type="application/javascript">
    window.CHAT = {
        socket: null,
        init: function() {
            if (window.WebSocket){
                CHAT.socket = new WebSocket("ws://127.0.0.1:8088/ws");

                CHAT.socket.onopen = function() {
                    console.log("onopen连接成功。。。");
                },
                    CHAT.socket.onclose = function() {
                        console.log("onclose连接关闭。。。");

                    },
                    CHAT.socket.onerror = function() {
                        console.log("onerror发生异常。。。");

                    },
                    CHAT.socket.onmessage = function(e) {
                        console.log("onmessage接收到消息:"+e.data);
                        var receiveMsg = document.getElementById("receiveMsg");
                        var html = receiveMsg.innerHTML;
                        receiveMsg.innerHTML = html+"<br>" + e.data;
                    }

            }else{
                alert("浏览器不支持websocket协议.....");
            }
        },
        chat: function() {
            var msg = document.getElementById("msgContent");
            CHAT.socket.send(msg.value);
        }
    }

    CHAT.init();
</script>

</body>
</html>