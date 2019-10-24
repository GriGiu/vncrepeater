# VNC repeater

For complete info, see UltraVNC documentation : 
- https://www.uvnc.com/docs/uvnc-repeater.html 
- https://www.uvnc.com/docs/uvnc-repeater/72-usage-repeater-.html 

For run container :
> docker run --name vncrepeater -d -t -p5901:5901 -p5500:5500 grigiu/vncrepeater:latest


For use compose see compose file and exec :

> docker-compose -f compose-vncrepeater.yml up -d

The following commands must be given by logging into the container ( docker exec -it vncrepeater bash ) :

- Edit configuration to suit your needs : 
> /etc/uvnc/uvncrepeater.ini

- Start/Stop service : 
> service uvncrepeater start/stop

- To moniter the logs: 
> tail -f /var/log/uvncrepeater.log






