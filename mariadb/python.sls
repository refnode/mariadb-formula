{% from "mariadb/map.jinja" import mariadb with context %}

{% if mariadb.formula_supported == True %}

mysql_python:
  pkg.installed:
    - name: {{ mariadb.libs.python.pkg_name }}

{% endif %}