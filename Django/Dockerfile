# Debian
from debian

#[Bascos]
run     echo "root:test1234" | chpasswd
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update --fix-missing && apt-get -y upgrade --fix-missing
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update --fix-missing && DEBIAN_FRONTEND=noninteractive apt-get install --fix-missing -y apt-utils apache2 openssh-server mysql-server vim rsync python3 libapache2-mod-wsgi-py3 libmysqlclient-dev python3-pip

RUN DEBIAN_FRONTEND=noninteractive ln -s /usr/bin/python3 /usr/bin/python
RUN DEBIAN_FRONTEND=noninteractive pip3 install virtualenv

ADD ./defaultapache /root/defaultapache
ADD ./inicio2.sh /root/inicio2.sh
RUN chmod +x /root/inicio2.sh
ENTRYPOINT ["/root/inicio2.sh"]
#[EXPOSE] Expose ports to the host machine
expose 80 22 3306 

CMD ["/usr/bin/ssh", "-D"]
