echo Installing depedencies...
sudo apt-get install -y unzip
SERF_ZIP=serf.zip
echo Installing Serf...
unzip $SERF_ZIP
sudo chmod +x serf
sudo mv serf /usr/local/bin/serf
sudo cp ./serf-agent.conf /etc/init/
start serf-agent
