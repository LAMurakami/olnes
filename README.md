# Olnes West Subdivision - ASLS 81-38

[olnes.lam1.us](http://olnes.lam1.us/)
[olnes.lamurakami.com](http://olnes.lamurakami.com/)

This repo contains content in the html folder and an apache2 configuration
that can be implemented with:

 sudo ln -s /var/www/olnes/olnes_apache2.conf \
 /etc/apache2/sites-available/060_olnes.conf

 sudo a2ensite 060_olnes
 sudo systemctl reload apache2

If the repo contents are installed in a location other than /var/www
the path in the configuration and in the instuctions would have to be modified.

The olnes_archive_rebuild.bash script will Rebuild an archive of /var/www/olnes
resources when they change.  It is intended to be run daily with:

 ln -s /var/www/olnes/olnes_archive_rebuild.bash /mnt/efs/aws-lam1-ubuntu/olnes

This would then be picked up by the Daily cron job to backup
/mnt/efs/aws-lam1-ubuntu archives.

 $ cat /etc/cron.daily/Bk-20-aws-changes
 #!/bin/bash
 run-parts --report /mnt/efs/aws-lam1-ubuntu
 [19:34:30 Sunday 06/14/2020] ubuntu@aws
