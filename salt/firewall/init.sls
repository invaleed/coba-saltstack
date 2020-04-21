public:
  firewalld.present:
    - name: public
    - block_icmp:
      - echo-reply
      - echo-request
    - default: False
    - masquerade: True
    - ports:
      - 22/tcp
      - 80/tcp
      - 443/tcp
