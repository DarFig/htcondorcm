#------------------------------
# htcondorcm imagen cm de condor sobre ubuntu
#------------------------------
# changelog
# - 1.0: basada en sshbaseimage, htcondor 9.4.0
#------------------------------


ARG VERSION=STABLE

FROM ghcr.io/darfig/sshbaseimage:latest

LABEL manteiner="https://github.com/DarFig"
LABEL licenses="Apache-2.0"



#RUN echo "use ROLE : CentralManager"

ENV HTCONDOR_PASSWORD="NONE"
ENV CENTRAL_MANAGER="127.0.0.1"

ADD https://get.htcondor.org /getcondor.sh
RUN chmod u+x /getcondor.sh
RUN /getcondor.sh --no-dry-run --channel stable

ADD configure.sh ./configure.sh
RUN chmod a+x ./configure.sh

EXPOSE 9618
EXPOSE 22

ENTRYPOINT ["configure.sh"]
