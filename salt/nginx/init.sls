nginx:
  pkg.installed:
    - name:
      - nginx
      - nginx-extras

nginx.conf:
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://nginx/files/nginx.conf

index.php:
  file.managed:
    - name: /usr/share/nginx/html/index.php
    - source: salt://nginx/files/index.php

restart_nginx:
  service.running:
    - name: nginx
    - enable: True
      watch:
        - file: /etc/nginx/nginx.conf
