#!/bin/bash

usage() { echo "Usage: $0 -u hass url -U hass user -k hass mqtt key -d device mac address" >&2; exit 1; }

while getopts ":u:U:k:d:" o; do
    case "${o}" in
        u)
            hass_url=${OPTARG}
            ;;
        U)
            hass_usr=${OPTARG}
            ;;
        k)
            hass_mqtt_key=${OPTARG}
            ;;
        d)
            ieq_mac=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done

if [ -z "$hass_url" ] || [ -z "$hass_usr" ] || [ -z "$hass_mqtt_key" ] || [ -z "$ieq_mac" ]; then
    echo 'Missing arguments!' >&2
    usage
    exit 1
fi

mosquitto_pub -h ${hass_url} -u ${hass_usr} -P ${hass_mqtt_key} -t 'homeassistant/sensor/'${ieq_mac}'_tsl_h/config' -m '{"name": "Light Horizontal","state_topic": "EP/measurements/'${ieq_mac}'","device_class": "illuminance","value_template": "{% for sen in value_json.sensors %}{% if sen.senId == 0%}{% for out in sen.outs %}{% if out.outId == 0%}{{out.processed|round(2)}}{% endif %}{% endfor %}{% endif %}{% endfor %}","unique_id": "'${ieq_mac}'_tsl_h","device": {  "name": "Indoor Environment Quality",  "manufacturer": "ecoPlanos",  "model": "IEQ",  "identifiers": ["'${ieq_mac}'"]}}'
mosquitto_pub -h ${hass_url} -u ${hass_usr} -P ${hass_mqtt_key} -t 'homeassistant/sensor/'${ieq_mac}'_press/config' -m '{"name": "Pressure","state_topic": "EP/measurements/'${ieq_mac}'","device_class": "atmospheric_pressure","value_template": "{% for sen in value_json.sensors %}{% if sen.senId == 1%}{% for out in sen.outs %}{% if out.outId == 0%}{{out.processed|round(2)}}{% endif %}{% endfor %}{% endif %}{% endfor %}","unique_id": "'${ieq_mac}'_press","device": {  "name": "Indoor Environment Quality",  "manufacturer": "ecoPlanos",  "model": "IEQ",  "identifiers": ["'${ieq_mac}'"]}}'
mosquitto_pub -h ${hass_url} -u ${hass_usr} -P ${hass_mqtt_key} -t 'homeassistant/sensor/'${ieq_mac}'_sht85_temp/config' -m '{"name": "Temperature","state_topic": "EP/measurements/'${ieq_mac}'","device_class": "temperature","value_template": "{% for sen in value_json.sensors %}{% if sen.senId == 2%}{% for out in sen.outs %}{% if out.outId == 0%}{{out.processed|round(2)}}{% endif %}{% endfor %}{% endif %}{% endfor %}","unique_id": "'${ieq_mac}'_sht85_temp","device": {  "name": "Indoor Environment Quality",  "manufacturer": "ecoPlanos",  "model": "IEQ",  "identifiers": ["'${ieq_mac}'"]}}'
mosquitto_pub -h ${hass_url} -u ${hass_usr} -P ${hass_mqtt_key} -t 'homeassistant/sensor/'${ieq_mac}'_sht85_rh/config' -m '{"name": "RH","state_topic": "EP/measurements/'${ieq_mac}'","device_class": "humidity","value_template": "{% for sen in value_json.sensors %}{% if sen.senId == 2%}{% for out in sen.outs %}{% if out.outId == 1%}{{out.processed|round(2)}}{% endif %}{% endfor %}{% endif %}{% endfor %}","unique_id": "'${ieq_mac}'_sht85_rh","device": {  "name": "Indoor Environment Quality",  "manufacturer": "ecoPlanos",  "model": "IEQ",  "identifiers": ["'${ieq_mac}'"]}}'
mosquitto_pub -h ${hass_url} -u ${hass_usr} -P ${hass_mqtt_key} -t 'homeassistant/sensor/'${ieq_mac}'_ch2o/config' -m '{"name": "Formaldehyde","state_topic": "EP/measurements/'${ieq_mac}'","unit_of_measurement": "ppm","value_template": "{% for sen in value_json.sensors %}{% if sen.senId == 3%}{% for out in sen.outs %}{% if out.outId == 0%}{{out.processed|round(2)}}{% endif %}{% endfor %}{% endif %}{% endfor %}","unique_id": "'${ieq_mac}'_ch2o","device": {  "name": "Indoor Environment Quality",  "manufacturer": "ecoPlanos",  "model": "IEQ",  "identifiers": ["'${ieq_mac}'"]}}'
mosquitto_pub -h ${hass_url} -u ${hass_usr} -P ${hass_mqtt_key} -t 'homeassistant/sensor/'${ieq_mac}'_co2/config' -m '{"name": "CO2","state_topic": "EP/measurements/'${ieq_mac}'","device_class": "carbon_dioxide","value_template": "{% for sen in value_json.sensors %}{% if sen.senId == 4%}{% for out in sen.outs %}{% if out.outId == 0%}{{out.processed|round(0)}}{% endif %}{% endfor %}{% endif %}{% endfor %}","unique_id": "'${ieq_mac}'_co2","device": {  "name": "Indoor Environment Quality",  "manufacturer": "ecoPlanos",  "model": "IEQ",  "identifiers": ["'${ieq_mac}'"]}}'
mosquitto_pub -h ${hass_url} -u ${hass_usr} -P ${hass_mqtt_key} -t 'homeassistant/sensor/'${ieq_mac}'_pm1/config' -m '{"name": "PM1","state_topic": "EP/measurements/'${ieq_mac}'","device_class": "pm1","value_template": "{% for sen in value_json.sensors %}{% if sen.senId == 5%}{% for out in sen.outs %}{% if out.outId == 0%}{{out.processed}}{% endif %}{% endfor %}{% endif %}{% endfor %}","unique_id": "'${ieq_mac}'_pm1","device": {  "name": "Indoor Environment Quality",  "manufacturer": "ecoPlanos",  "model": "IEQ",  "identifiers": ["'${ieq_mac}'"]}}'
mosquitto_pub -h ${hass_url} -u ${hass_usr} -P ${hass_mqtt_key} -t 'homeassistant/sensor/'${ieq_mac}'_pm25/config' -m '{"name": "PM2.5","state_topic": "EP/measurements/'${ieq_mac}'","device_class": "pm25","value_template": "{% for sen in value_json.sensors %}{% if sen.senId == 5%}{% for out in sen.outs %}{% if out.outId == 1%}{{out.processed}}{% endif %}{% endfor %}{% endif %}{% endfor %}","unique_id": "'${ieq_mac}'_pm25","device": {  "name": "Indoor Environment Quality",  "manufacturer": "ecoPlanos",  "model": "IEQ",  "identifiers": ["'${ieq_mac}'"]}}'
mosquitto_pub -h ${hass_url} -u ${hass_usr} -P ${hass_mqtt_key} -t 'homeassistant/sensor/'${ieq_mac}'_pm10/config' -m '{"name": "PM10","state_topic": "EP/measurements/'${ieq_mac}'","device_class": "pm10","value_template": "{% for sen in value_json.sensors %}{% if sen.senId == 5%}{% for out in sen.outs %}{% if out.outId == 2%}{{out.processed}}{% endif %}{% endfor %}{% endif %}{% endfor %}","unique_id": "'${ieq_mac}'_pm10","device": {  "name": "Indoor Environment Quality",  "manufacturer": "ecoPlanos",  "model": "IEQ",  "identifiers": ["'${ieq_mac}'"]}}'
mosquitto_pub -h ${hass_url} -u ${hass_usr} -P ${hass_mqtt_key} -t 'homeassistant/binary_sensor/'${ieq_mac}'_motion/config' -m '{"name": "Motion","state_topic": "EP/measurements/'${ieq_mac}'","device_class": "motion","value_template": "{% for sen in value_json.sensors %}{% if sen.senId == 6%}{% for out in sen.outs %}{% if out.outId == 0%}{{out.processed}}{% endif %}{% endfor %}{% endif %}{% endfor %}","unique_id": "'${ieq_mac}'_motion","device": {  "name": "Indoor Environment Quality",  "manufacturer": "ecoPlanos",  "model": "IEQ",  "identifiers": ["'${ieq_mac}'"]}}'
mosquitto_pub -h ${hass_url} -u ${hass_usr} -P ${hass_mqtt_key} -t 'homeassistant/sensor/'${ieq_mac}'_sound_press/config' -m '{"name": "Noise","state_topic": "EP/measurements/'${ieq_mac}'","device_class": "sound_pressure","value_template": "{% for sen in value_json.sensors %}{% if sen.senId == 7%}{% for out in sen.outs %}{% if out.outId == 0%}{{out.processed|round(1)}}{% endif %}{% endfor %}{% endif %}{% endfor %}","unique_id": "'${ieq_mac}'_sound_press","device": {  "name": "Indoor Environment Quality",  "manufacturer": "ecoPlanos",  "model": "IEQ",  "identifiers": ["'${ieq_mac}'"]}}'
mosquitto_pub -h ${hass_url} -u ${hass_usr} -P ${hass_mqtt_key} -t 'homeassistant/sensor/'${ieq_mac}'_tsl_v/config' -m '{"name": "Light Vertical","state_topic": "EP/measurements/'${ieq_mac}'","device_class": "illuminance","value_template": "{% for sen in value_json.sensors %}{% if sen.senId == 8%}{% for out in sen.outs %}{% if out.outId == 0%}{{out.processed|round(2)}}{% endif %}{% endfor %}{% endif %}{% endfor %}","unique_id": "'${ieq_mac}'_tsl_v","device": {  "name": "Indoor Environment Quality",  "manufacturer": "ecoPlanos",  "model": "IEQ",  "identifiers": ["'${ieq_mac}'"]}}'
mosquitto_pub -h ${hass_url} -u ${hass_usr} -P ${hass_mqtt_key}  -t 'homeassistant/sensor/'${ieq_mac}'_modern_w/config' -m '{"name": "Wind Speed","state_topic": "EP/measurements/'${ieq_mac}'","device_class": "wind_speed","value_template": "{% for sen in value_json.sensors %}{% if sen.senId == 9%}{% for out in sen.outs %}{% if out.outId == 0%}{{out.processed|round(2)}}{% endif %}{% endfor %}{% endif %}{% endfor %}","unique_id": "'${ieq_mac}'_modern_w","device": {  "name": "Indoor Environment Quality",  "manufacturer": "ecoPlanos",  "model": "IEQ",  "identifiers": ["'${ieq_mac}'"]}}'
