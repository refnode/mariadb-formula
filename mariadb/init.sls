{% from "mariadb/map.jinja" import mariadb with context %}

{% if mariadb.formula_supported == True %}

include:
  - mariadb.client
  - mariadb.server
  - mariadb.firewall
  

{% endif %}
