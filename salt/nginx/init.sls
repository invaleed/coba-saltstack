nginx:
  pkg.installed:
    - name:
      - nginx
      - nginx-extras

nginx.conf:
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://nginx/files/nginx.conf

restart_nginx:
  service.running:
    - name: nginx
    - enable: True
      watch:
        - file: /etc/nginx/nginx.conf
