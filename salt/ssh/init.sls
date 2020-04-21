ssh:
  file.managed:
    - user: root
    - group: root
    - mode: '0644'
    - names: 
      - /etc/ssh/sshd_config:
        - source: salt://ssh/files/sshd_config
      - /etc/issue:
        - source: salt://ssh/files/issue

restart_ssh:
  service.running:
    - name: sshd
    - enable: True
      watch:
        - file: /etc/ssh/sshd_config
