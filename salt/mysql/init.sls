mariadb-server:
  pkg.installed:
    - names: 
      - mariadb-server
      - python2-PyMySQL

mariadb-service-enabled:
  service.running:
    - name: mariadb
    - enable: True

mysql_root_password:
  cmd.run:
    - name: mysqladmin --user root password 'PASSW0RD'
    - require:
      - service: mariadb
