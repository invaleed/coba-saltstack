redis-server:
  cmd.run:
    - name: |
        cd /tmp
        wget -c http://download.redis.io/redis-stable.tar.gz
        tar xvzf redis-stable.tar.gz
        cd redis-stable/deps
        make hiredis jemalloc linenoise lua geohash-int
        cd ..
        make
        cp /src/redis-cli /usr/local/bin/
        make install
        cd utils
        ./install_server.sh
    - cwd: /tmp
    - shell: /bin/bash
    - timeout: 500
    - unless: test -x /usr/local/bin/redis-cli
