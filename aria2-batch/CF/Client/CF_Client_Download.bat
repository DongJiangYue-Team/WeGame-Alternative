@pushd %~dp0 >nul 2>nul
aria2\aria2c.exe --allow-overwrite="true" -d Resources https://cdn.jsdelivr.net/gh/DongJiangYue-Team/WeGame-Alternative@main/aria2-config/CF/Client-Latestversion/CF_Client
aria2\aria2c.exe aria2c --continue="true" --referer="http://down.qq.com/" --user-agent="Mozilla/4.0 (compatible; MSIE 9.11; Windows NT 10.0; .NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729; .TDCH 7.0;)" -d Download -i Resources\CF_Client
exit