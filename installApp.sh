sudo killall -9 dotnet
nohup dotnet /home/ec2-user/src/API/build_output/API.dll &>/dev/null &