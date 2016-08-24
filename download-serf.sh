SERF_ZIP=serf.zip
if [ ! -f $SERF_ZIP ]; then
        echo "Downloading Serf..."
        wget --quiet https://releases.hashicorp.com/serf/0.7.0/serf_0.7.0_linux_amd64.zip -O $SERF_ZIP
fi
