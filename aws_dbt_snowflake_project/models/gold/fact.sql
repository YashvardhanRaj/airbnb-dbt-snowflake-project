{% set configs = [
    {
    "table" : "AIRBNBSNOW.DBT_SCHEMA_GOLD.OBT",
    "columns" : "obt_gold.BOOKING_ID,obt_gold.LISTING_ID,obt_gold.HOST_ID,obt_gold.TOTAL_BOOKING_AMOUNT,obt_gold.SERVICE_FEE,obt_gold.CLEANING_FEE,obt_gold.ACCOMMODATES,obt_gold.BEDROOMS,obt_gold.BATHROOMS,obt_gold.PRICE_PER_NIGHT,obt_gold.RESPONSE_RATE", 
    "alias" : "obt_gold"
    },
    {
    "table" : "AIRBNBSNOW.DBT_SCHEMA_GOLD.DIM_LISTINGS",
    "columns" : "" ,
    "alias" : "gold_listings",
    "join_condition" : "obt_gold.LISTING_ID = gold_listings.LISTING_ID"
    },
    {
        "table" : "AIRBNBSNOW.DBT_SCHEMA_GOLD.DIM_HOSTS",
        "columns" : "",
        "alias" :"gold_hosts",
        "join_condition" : "gold_listings.HOST_ID = gold_hosts.HOST_ID"
    }
]
%}

SELECT 
    {{configs[0]['columns']}} 
    
FROM 
    {% for config in configs %}
    {% if loop.first %}
        {{config['table']}} AS {{ config['alias'] }}
    {% else %}
        LEFT JOIN {{config['table']}} AS {{ config['alias'] }} ON {{config['join_condition']}}
        {% endif %}
        {% endfor %}

       
