
POC to provide web page solution to shutdown home network server.
This page can be provided via server ran Heimdal for all homenetwork machines

IDEA:
Small web page provides "server shutdown" button, when pressed, message file is being
created to server docker volumes (shared area with the host)

Host cron run message file checker detectds this and initates host shutdown

SETUP:
execute for directory creations: ./setup.sh

BUILD FLASK APP:
sudo docker build -t flask.app .

RUN FLASK APP:
sudo docker run --restart always -d -p 5000:5000 -v /var/tmp:/shared flask.app



UBUNTU CRON USAGE FOR MESSAGECHECKER:

Add exuce rights: chmod a+x /full path to/spy.sh

start corntab: crontab -e

Add line:

*/4 * * * * /full path to/spy.sh

Now every 5th minute shutdown message file existence is checked



NIXOS CRON USAGE FOR MESSAGECHECKER: