# Olnes West Subdivision - ASLS 81-38

[olnes.lam1.us](http://olnes.lam1.us/)
[olnes.lamurakami.com](http://olnes.lamurakami.com/)

This repo contains content in the html folder and an apache2 configuration
that can be implemented with:

 cd /var/www ; git clone https://gitlab.com/aws-lam/olnes

 sudo ln -s /var/www/olnes/olnes_apache2.conf /etc/apache2/sites-available/060_olnes.conf

 sudo a2ensite 060_olnes
 sudo systemctl reload apache2

If the repo contents are installed in a location other than /var/www
the path in the configuration and in the instuctions would have to be modified.

## GitLab and GitHub public Projects/Repositories
The
[gitlab.com/aws-lam/olnes](https://gitlab.com/aws-lam/olnes)
Project is a clone of the
[github.com/LAMurakami/olnes](https://github.com/LAMurakami/olnes)
Repostory.  My
[gitlab.com/LAMurakami](https://gitlab.com/LAMurakami)
account was created so that Projects can be cloned using https without
authentication over IPv6 as well as IPv4 unlike the
[github.com/LAMurakami](https://github.com/LAMurakami)
Repostories that can only be accessed over IPv6 with the
[IPv6 only workaround.](https://lamurakami.github.io/blog/2024/06/05/Access-GitHub-com-from-an-instance-without-a-public-IPv4-address.html)
