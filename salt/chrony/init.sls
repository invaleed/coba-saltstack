chrony:
  file.managed:
    - name : /etc/chrony.conf
    - source: salt://chrony/files/chrony.conf

restart_chrony:
  service.running:
    - name: chronyd
    - enable: True
      watch:
        - file: /etc/chrony.conf
