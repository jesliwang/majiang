部署说明
1. 修改server/apache-tomcat-7.0.82/conf/server.xml中的docBase,workDir配置
<Context path="" reloadable="true" docBase="/root/majiang/server/GameServer-MJ/WebRoot" workDir="/root/majiang/server/GameServer-MJ/work" />
2. 修改数据库配置
server/GameServer-MJ/WebRoot/WEB-INF/classes/myBatisConfig.xml


3.启动和关闭
bin/startup.sh
bin/shutdown.sh
