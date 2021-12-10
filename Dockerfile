#------------------------------
# htcondorcm imagen cm de condor sobre ubuntu
#------------------------------
# changelog
# - 1.0: basada en sshbaseimage, htcondor 9.4.0
#------------------------------


ARG VERSION=V9_4_0

FROM ghcr.io/darfig/sshbaseimage:latest

LABEL manteiner="https://github.com/DarFig"
LABEL licenses="Apache-2.0"



#RUN echo "use ROLE : CentralManager"

ENV HTCONDOR_PASSWORD=""
ENV CENTRAL_MANAGER=""

#ADD https://get.htcondor.org /getcondor.sh
#RUN chmod u+x /getcondor.sh
RUN curl -fsSL https://get.htcondor.org | GET_HTCONDOR_PASSWORD="$HTCONDOR_PASSWORD" /bin/bash -s -- --no-dry-run --channel "$VERSION" --central-manager $CENTRAL_MANAGER

EXPOSE 9618
EXPOSE 22

