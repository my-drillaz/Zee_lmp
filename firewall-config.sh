yum -y install firewalld

systemctl start firewalld

systemctl enable firewalld

firewall-cmd --add-port={10051/tcp,10050/tcp} --permanent

firewall-cmd --permanent --zone=public --add-service=http
 
firewall-cmd --permanent --zone=public --add-service=https

firewall-cmd --reload
