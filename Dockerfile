 FROM container-registry.oracle.com/graalvm/jdk:24

 RUN microdnf install yum

 # Install Chrome
 RUN yum install wget unzip
 RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
 RUN yum install google-chrome-stable_current_x86_64.rpm

 # Install ChromeDriver
 RUN wget https://storage.googleapis.com/chrome-for-testing-public/145.0.7632.26/linux64/chromedriver-linux64.zip
 RUN unzip chromedriver-linux64.zip
 RUN chmod 755 chromedriver-linux64/chromedriver
 RUN mv chromedriver-linux64/chromedriver /usr/local/bin/chromedriver

 # Change the home directory to /home/daemon.
 RUN mkdir -p /home/daemon
 RUN usermod -d /home/daemon daemon
 RUN chown daemon:daemon /home/daemon

