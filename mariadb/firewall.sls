{% from "mariadb/map.jinja" import mariadb with context %}
{% if mariadb.formula_supported == True %}

{% if mariadb.manage_firewall == True %}

firewalld:
  pkg.purged:
    - name: firewalld

iptables_default_mysql_allow_0.0.0.0:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - source: 0.0.0.0
    - dport: {{ mariadb.config_common.service.port }}
    - proto: tcp


{% endif %}

{% endif %}