users_sysadmin_user:
  user.present:
    - name: sysadmin
    - home: /home/sysadmin
    - shell: /bin/bash
    - groups:
      - adm
      - wheel
