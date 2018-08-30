FROM python:3.6
ARG START_FILE
ARG GITLAB_USERNAME
ARG GITLAB_PASSWORD
ENV PYTHONUNBUFFERED 1
COPY $START_FILE /start.sh
COPY ./requirements requirements
COPY ./docker/dev/worker/slic3r-linux-x86_64-1-2-9-stable.tar.gz .

RUN apt-get update && apt-get -y install build-essential
RUN apt-get -y install git
RUN pip install -U -r requirements/requirements.txt
RUN sed -i 's/\r//' /start.sh && \
    chmod +x /start.sh && \
    tar -xvzf slic3r-linux-x86_64-1-2-9-stable.tar.gz && \
    rm -f slic3r-linux-x86_64-1-2-9-stable.tar.gz && \
    chmod +x /Slic3r/bin/slic3r && \
    ln -s /Slic3r/bin/slic3r /usr/local/bin/
