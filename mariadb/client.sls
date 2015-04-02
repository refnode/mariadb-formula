{% from "mariadb/map.jinja" import mariadb with context %}

{% if mariadb.formula_supported == True %}

mariadb_client:
  pkg.installed:
    - name: {{ mariadb.client.pkg_name }}

mariadb_cfg_client:
  file.managed:
    - name: {{ mariadb.client.cfg_file.name }}
    - template: jinja
    - source: {{ mariadb.client.cfg_file.template }}
    - user: {{ mariadb.client.cfg_file.owner }}
    - group: {{ mariadb.client.cfg_file.group }}
    - mode: {{ mariadb.client.cfg_file.mode }}

{% endif %}