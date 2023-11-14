# !/bin/bash

# 5 домашка , ХЗ що вийде , це мій 3 - 4 скріпт за життя , прошу не судити сурово 

# оголошення масиву
options=("Ubuntu" "Fedora" "CentOS")
#функція для виведення меню 
function print_menu () {
    echo "яка в тебе OS?"
    for i in "${!options[@]}"; do
        echo "$i) ${options[$i]}"
    done
}
# цикл прогрвми
while true; do
    print_menu
    read -p "Ваш вибір " choice

    case $choice in
    0)
        echo "Ви вибрали Ubuntu"
            sudo apt-get update && sudo apt-get upgrade
            sudo apt install apache2 -y
            sudo apt install mariadb-server mariadb-client -y
            sudo systemctl start mariadb
            sudo systemctl enable mariadb
            sudo mysql_secure_installation
            sudo ufw allow 'Apache'
            sudo ufw allow 'Apache Secure'
            sudo apt install docker.io -y
            sudo systemctl start docker
            sudo systemctl enable docker
            sudo usermod -aG docker $USER
            sudo ufw --force enable
            sudo reboot
        ;;
    1)
        echo "Ви вибали Fedore"
# встановелння та налаштування софта
            sudo dnf update -y
            sudo dnf install httpd -y
            sudo systemctl start httpd
            sudo systemctl enable httpd
            sudo dnf install mariadb-server mariadb -y
            sudo systemctl start mariadb
            sudo systemctl enable mariadb
            sudo mysql_secure_installation
            sudo firewall-cmd --permanent --add-service=http
            sudo firewall-cmd --permanent --add-service=https
            sudo firewall-cmd --reload
            sudo dnf install docker -y
            sudo systemctl start docker
            sudo systemctl enable docker
            sudo usermod -aG docker $USER
        ;;
    2)
            echo "Ви вибрали CentOS"
    # встановелння та налаштування софта
            sudo yum -y update
            sudo yum -y install httpd
            sudo systemctl start httpd
            sudo systemctl enable httpd
            sudo yum -y install mariadb-server mariadb
            sudo systemctl start mariadb
            sudo systemctl enable mariadb
            sudo mysql_secure_installation
            sudo firewall-cmd --permanent --add-service=http
            sudo firewall-cmd --permanent --add-service=https
            sudo firewall-cmd --reload
            sudo yum -y install docker
            sudo systemctl start docker
            sudo systemctl enable docker
            sudo usermod -aG docker $USER
        ;;
    esac
sudo reboot
done


# це я роблю зміни на 1 гілці 
# завдання 7, просто зміни 