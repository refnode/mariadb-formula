{% from "mariadb/map.jinja" import mariadb with context %}

{% if mariadb.formula_supported == True %}

include:
  - mariadb.python

mariadb_server:
  pkg.installed:
    - name: {{ mariadb.server.pkg_name }}
  service.running:
    - name: {{ mariadb.server.service_name }}
    - enable: True
    - watch:
      - pkg: mariadb_server

mariadb_cfg_commmon:
  file.managed:
    - name: {{ mariadb.config_common.cfg_file.name }}
    - template: jinja
    - source: {{ mariadb.config_common.cfg_file.template }}
    - watch_in:
      - service: mariadb
    - user: {{ mariadb.config_common.cfg_file.owner }}
    - group: {{ mariadb.config_common.cfg_file.group }}
    - mode: {{ mariadb.config_common.cfg_file.mode }}

mariadb_cfg_server:
  file.managed:
    - name: {{ mariadb.server.cfg_file.name }}
    - template: jinja
    - source: {{ mariadb.server.cfg_file.template }}
    - watch_in:
      - service: mariadb
    - user: {{ mariadb.server.cfg_file.owner }}
    - group: {{ mariadb.server.cfg_file.group }}
    - mode: {{ mariadb.server.cfg_file.mode }}

{% endif %}