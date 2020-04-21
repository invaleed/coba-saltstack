# coba-saltstack
Saltstack for very beginner :D

# Environment:

Masters : CentOS 7
Minion : Oracle Linux 8

Config /etc/hosts
```bash
# cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

192.168.65.112  salt-minion01
192.168.65.140  salt-master01
192.168.65.190  salt-master02
```

Master config
```yaml
# cat /etc/salt/master

interface: 192.168.65.140
file_roots:
  base:
    - /srv/salt/
log_level: debug
log_level_logfile: debug
```

Minion config
```yaml
# cat /etc/salt/minion

master: 
  - salt-master01
  - salt-master02
```

Sync config between Master (put in crontab)

```bash
# rsync -avz --delete /etc/salt/pki/master/* root@salt-master02:/etc/salt/pki/master/
# rsync -avz --delete /srv root@salt-master02:/
```

## Usage

```bash
# cd /
# git clone https://github.com/invaleed/coba-saltstack.git srv
```

Generate password for user
```bash
# openssl passwd -1
Password: [secret123]
Verifying - Password: [secret123]
$1$O8HcPLj3$jLSViyJj77902J5KG1sW/1
```

## Test
```bash
# salt '*' state.highstate test=True
# salt '*' state.highstate
```

