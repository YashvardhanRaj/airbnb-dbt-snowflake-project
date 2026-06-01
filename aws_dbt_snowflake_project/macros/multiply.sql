{% macro multiply(x, y,precision) %}
    Round({{ x }} *{{ y }}, {{ precision }})
{% endmacro %}