FROM python:latest
RUN pip install prometheus_client requests
WORKDIR /
ADD sensu-alertmanager /
EXPOSE 8080 9898
CMD [ "python3", "-u", "/sensu-alertmanager" ]
