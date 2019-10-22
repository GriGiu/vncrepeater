# Ultra VNC repeater

For complete info, see UltraVNC documentation : https://www.uvnc.com/docs/uvnc-repeater.html 

For run container :
docker run --name vncrepeater -i -t -d -p5901:5901 -p5500:5500 grigiu/vncrepeater:latest

For use compose see compose file and exec :

docker-compose -f compose-vncrepeater.yml up -d




