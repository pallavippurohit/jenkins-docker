FROM ubuntu

RUN apt update -y && apt upgrade -y

RUN DEBIAN_FRONTEND="noninteractive" apt-get install curl openjdk-17-jdk vim apt-transport-https wget gnupg -y

RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -

RUN echo deb https://pkg.jenkins.io/debian binary/ > /etc/apt/sources.list.d/jenkins.list

RUN apt update -y && apt install -y jenkins

####
CMD ["java", "-DJENKINS_HOME=/var/lib/jenkins", "-jar", "/usr/share/jenkins/jenkins.war"]
