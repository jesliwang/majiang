部署说明
1. 修改server/apache-tomcat-7.0.82/conf/server.xml中的docBase,workDir配置
<Context path="" reloadable="true" docBase="/root/majiang/server/GameServer-MJ/WebRoot" workDir="/root/majiang/server/GameServer-MJ/work" />
2. 修改数据库配置
server/GameServer-MJ/WebRoot/WEB-INF/classes/myBatisConfig.xml


3.启动和关闭
bin/startup.sh
bin/shutdown.sh


# 结构说明
1. 数据库
   数据库使用了 ibatis来生成，安装了mybatis来生成的。在ibatis-generator-config/mybatis-generator-config.xml 邮件，可以看到Generate MyBatis功能。如果没有，需要安装mybatis插件

2. 简单代码结构的说明
  ConnectAPI类是网关协议，所有的协议号都在这里定义

  MsgProcessorRegister 这个enum类似处理客户端的请求到处理函数的调用
  com.dyz.gameserver.msg.processor.* 这些是来处理客户端你请求的
  com.dyz.gameserver.msg.response.* 这些是向客户端额返回

  com.dyz.gameserver.logic.* 这些是游戏逻辑

  com.dyz.myBatis.* 这里是数据库操作的类。这里有些是自动生成的，有些是自己加的，要注意下

3. 传输的数据： 这个是Json发送的，所以注意客户端和服务器用的变量名的大小写一致
