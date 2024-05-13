postmortem is a process intended to help you learn from past incidents. It typically involves discussion soon after an event has taken place.
Postmortems blame-free discussion event has taken place. An artifact is produced that includes a detailed description of exactly what went wrong in order to cause the incident, along with a list of steps to take in order to prevent a similar incident from occurring again in the future. An analysis of how your incident response process itself worked during the incident should also be included in the analysis.
Organizations may refer to the postmortem process in slightly different ways:
1. Learning Review
2. After-Action Review
3. Incident Review
4. Incident Report
5. Post-Incident Review
6. Root Cause Analysis (or RCA)
Below is a postmortem outage sample :
Issue Summary
At approximately given time, the web server for the local pet shop, Spot's Spot, went down due to a security risk from running the Nginx web server as the root user
Root Cause: The Nginx web server was being run by root, was replaced by another service and could no longer listen on post 8080.
Timeline
The given time Web stack engineers check the currently running processes with ps auxff and find the Nginx web server is not running. They further investigate by running netstat -ldpn which gives them information about the processes running and their ports.
The given time Web stack engineers find apache2 is running on port 8080. They kill the process with pkill apache2 and use netstat -ldpn to confirm nothing is currently listening on port 8080.
The given time Engineers check the /etc/nginx directory to examine Nginx-specific files. They find the nginx.conf configuration file is owned by the user and group root, instead of nginx like all other nginx files, and does not contain any read, write, or execute privileges.
The given time Engineers change the owner and group to nginx with chown nginx:nginx nginx.conf and grant the user read, write, and execute privileges with chmod u+rwx nginx.conf.
Root Cause and Resolution
The root cause came from running the Nginx web server as the root user. This left the server vulnerable to attack and allowed a rival process, apache2, to take over (probably the doing of cats). This attack also removed nginx user privileges and changed the default port the server listens on.
Corrective and Preventative Measures
1. run Nginx with a less-privileged user
2. check default settings in files
3. add monitoring system

