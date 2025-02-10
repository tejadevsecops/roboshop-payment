sed -i -e "s/LICENSE_KEY/${NEW_RELIC_LICENSE_KEY}/" newrelic.ini
export PATH=${PATH}:/app/.local/bin/
NEW_RELIC_CONFIG_FILE=newrelic.ini newrelic-admin run-program uwsgi --ini payment.ini