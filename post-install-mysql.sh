#!/bin/bash
# Run MYSQL post-installation scripts
# NOTE: you might have to wait for mysql to start.
docker exec -ti mysql-configomatic sh -c "mysql < /config/setup.sql"
