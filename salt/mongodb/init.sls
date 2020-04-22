mongodb-org-4.2.repo:
  file.managed:
    - name: /etc/yum.repos.d/mongodb-org-4.2.repo
    - source: salt://mongodb/files/mongodb-org-4.2.repo

mongodb:
  pkg.installed:
    - name: mongodb-org

restart_mongodb:
  service.running:
    - name: mongod
    - enable: True
