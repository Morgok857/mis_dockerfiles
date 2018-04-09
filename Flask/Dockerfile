FROM ubuntu:latest
MAINTAINER Morgok857
RUN apt-get update -y
RUN apt-get install -y apt-utils python3-pip python3-dev build-essential
ADD requeriments.txt /root/requeriments.txt
WORKDIR /app
RUN pip3 install --upgrade pip
RUN pip3 install -r /root/requeriments.txt
ENTRYPOINT ["python3"]
CMD ["main.py"]
