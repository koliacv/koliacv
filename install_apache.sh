#!/bin/bash
#
#Installing apache web server on Ubuntu 
#
#pls runs with sudo 
#

sudo apt update -y 
sudo apt install apache2 -y
sudo ufw allow 'Apache'
echo "-------------------------------------------------------------Check ....--------------------------------------------------"
function check_apache(){
  if [ -x "$(command -v apache2)" ]; then
      echo "Apache already installed !"
  else
        echo "Apache not installed"
        sleep 2
echo "Do u want reinstall ? y or no"
read  yes
if  [ $yes == "y" ]; then
        echo "Installing Apache..."
        sudo apt update -y
        sudo apt install apache2 -y
        check_apache
fi
  fi
}
#call apache
check_apache
echo "-------Start setup Apache--------- "
cat <<EOF > /var/www/html/index.html

<html>
    <head>
    <title> DevOps GL BaseCamp </title>
<body>
  <h1>
    Kolia Palahniuk
  </h1>     
    <style>
    body {background-color: #EFA94A;} 
    h1 {text-align: center;}
    </style>
</body>
</head>
</html>
EOF

sudo systemctl start apache2
sudo systemctl enable apache2
echo "My ip :"
MYIP1=$(hostname -I | awk '{print $1}')
MYIP2=$(hostname -I | awk '{print $2}')
echo "go to ${MYIP1}:80 or ${MYIP2}:80"
sleep 3
