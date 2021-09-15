#!/bin/bash

curl -XPOST "http://localhost:9200/_aliases" -H 'Content-Type: application/json' -d'
{
 "actions" : [
    { "remove" : { "index" : "*", "alias" : "cowrie-logstash" } }
 ]
}'

curl -XDELETE "http://localhost:9200/cowrie-logstash"

curl -XPUT "http://localhost:9200/cowrie-logstash" -H 'Content-Type: application/json' -d'
{
"mappings": {
    "properties": {
    "message": {
        "type":  "keyword"
        },
        "geoip" : {
          "dynamic" : "true",
          "properties" : {
            "city_name" : {
              "type" : "text",
              "fields" : {
                "keyword" : {
                  "type" : "keyword",
                  "ignore_above" : 256
                }
              },
              "norms" : false
            },
            "continent_code" : {
              "type" : "text",
              "fields" : {
                "keyword" : {
                  "type" : "keyword",
                  "ignore_above" : 256
                }
              },
              "norms" : false
            },
            "country_code2" : {
              "type" : "text",
              "fields" : {
                "keyword" : {
                  "type" : "keyword",
                  "ignore_above" : 256
                }
              },
              "norms" : false
            },
            "country_code3" : {
              "type" : "text",
              "fields" : {
                "keyword" : {
                  "type" : "keyword",
                  "ignore_above" : 256
                }
              },
              "norms" : false
            },
            "country_name" : {
              "type" : "text",
              "fields" : {
                "keyword" : {
                  "type" : "keyword",
                  "ignore_above" : 256
                }
              },
              "norms" : false
            },
            "dma_code" : {
              "type" : "long"
            },
            "ip" : {
              "type" : "ip"
            },
            "latitude" : {
              "type" : "half_float"
            },
            "location" : {
              "type" : "geo_point"
            },
            "longitude" : {
              "type" : "half_float"
            },
            "postal_code" : {
              "type" : "text",
              "fields" : {
                "keyword" : {
                  "type" : "keyword",
                  "ignore_above" : 256
                }
              },
              "norms" : false
            },
            "region_code" : {
              "type" : "text",
              "fields" : {
                "keyword" : {
                  "type" : "keyword",
                  "ignore_above" : 256
                }
              },
              "norms" : false
            },
            "region_name" : {
              "type" : "text",
              "fields" : {
                "keyword" : {
                  "type" : "keyword",
                  "ignore_above" : 256
                }
              },
              "norms" : false
            },
            "timezone" : {
              "type" : "text",
              "fields" : {
                "keyword" : {
                  "type" : "keyword",
                  "ignore_above" : 256
                }
              },
              "norms" : false
            }
          }
        }
    }
}
}'

curl -XPOST "http://localhost:5601/api/saved_objects/_import" -H "kbn-xsrf: true" --form file=@elastic-config/dashboard.ndjson
