#!/bin/bash

<<PROGRAM_TEXT

This script will rebuild an archive of /var/www/olnes resources
 if any of the resources have been changed or added.

The archive is extracted on a new instance with:

tar -xvzf /mnt/efs/aws-lam1-ubuntu/olnes.tgz --directory /var/www

The following will list files changed since the archive was last rebuilt:

if [ $(find /var/www/olnes -newer /mnt/efs/aws-lam1-ubuntu/olnes.tgz -print \
 | sed 's|^/var/www/olnes/||' | grep -v '.git/' | grep -v '.git$' | wc -l) \
 -gt 0 ]
then
  find /var/www/olnes -newer /mnt/efs/aws-lam1-ubuntu/olnes.tgz \
  | grep -v '.git/' | grep -v '.git$' \
  | xargs ls -ld --time-style=long-iso  | sed 's|/var/www/olnes/||' 
fi

PROGRAM_TEXT

if [ $(find /var/www/olnes -newer /mnt/efs/aws-lam1-ubuntu/olnes.tgz -print \
| sed 's|^/var/www/olnes/||' | grep -v '.git/' \
| grep -v '.git$' | wc -l) -gt 0 ]; then

  echo Recreating the aws-lam1-ubuntu/olnes.tgz archive

  rm -f /mnt/efs/aws-lam1-ubuntu/olnes.t{gz,xt}

  tar -cvzf /mnt/efs/aws-lam1-ubuntu/olnes.tgz \
  --exclude='olnes/.git' \
  --exclude='olnes/html/RCS' \
  --directory /var/www olnes 2>&1 \
  | tee /mnt/efs/aws-lam1-ubuntu/olnes.txt

fi
