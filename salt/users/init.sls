users_sysadmin_user:
  user.present:
    - name: sysadmin
    - home: /home/sysadmin
    - shell: /bin/bash
    - password: $1$O8HcPLj3$jLSViyJj77902J5KG1sW/1
    - enforce_password: True
    - groups:
      - adm
      - wheel
