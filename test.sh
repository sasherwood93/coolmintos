#!/bin/bash

#Get the necessary components
sudo apt-mark hold udisks2
sudo apt-get update -y
sudo apt-get install tigervnc-standalone-server dbus-x11 -y
sudo apt-get install xfe -y
sudo apt-get clean

wget https://raw.githubusercontent.com/Techriz/AndronixOrigin/master/APT/LXQT/xstartup -P ~/.vnc/
wget https://raw.githubusercontent.com/Techriz/AndronixOrigin/master/APT/LXQT/vncserver-start -P /usr/local/bin/
wget https://raw.githubusercontent.com/Techriz/AndronixOrigin/master/APT/LXQT/vncserver-stop -P /usr/local/bin/

chmod +x ~/.vnc/xstartup
chmod +x /usr/local/bin/vncserver-start
chmod +x /usr/local/bin/vncserver-stop

#Setup the necessary files
mkdir -p ~/.vnc
echo "#!/bin/bash
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
export PULSE_SERVER=127.0.0.1
XAUTHORITY=$HOME/.Xauthority
export XAUTHORITY                                                         
LANG=en_GB.UTF-8
export LANG
echo $$ > /tmp/xsession.pid
