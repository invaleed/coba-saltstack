ntp:
  pkg:
    - installed
  service:
    {% if grains['os'] == 'CentOS' or grains['os'] == 'RedHat' %}
    - name: ntpd
    {% endif %}
    - running
    - watch:
      - file: /etc/ntp.conf
  file.managed:
    {% if grains['os'] == 'Debian' or grains['os'] == 'Ubuntu' %}
    - name: /etc/ntp.conf
    - source: salt://ntp/ntp.conf.ubuntu.jinja
    {% elif grains['os'] == 'CentOS' or grains['os'] == 'RedHat' %}
    - name: /etc/ntp.conf
    - source: salt://ntp/ntp.conf.redhat.jinja
    {% endif %}
    - mode: 644
    - template: jinja
    - defaults:
          servers: ['0.pool.ntp.org',
                  '1.pool.ntp.org',
                  '2.pool.ntp.org',
                  '3.pool.ntp.org']
    - require:
      - pkg: ntp
