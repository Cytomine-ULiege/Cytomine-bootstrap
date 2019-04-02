#!/usr/bin/env bash

# Copyright (c) 2009-2018. Authors: see NOTICE file.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

. ../configuration.sh

if [[ $CORE_DEVELOPMENT = true ]]; then
    ADMIN_PWD="A"
    ADMIN_PUB_KEY="B"
    ADMIN_PRIV_KEY="C"
    SUPERADMIN_PUB_KEY="D"
    SUPERADMIN_PRIV_KEY="E"
    RABBITMQ_PUB_KEY="F"
    RABBITMQ_PRIV_KEY="G"
    IMS_PUB_KEY="H"
    IMS_PRIV_KEY="I"
    SERVER_ID="J"
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    ADMIN_PWD=$(cat /proc/sys/kernel/random/uuid)
    ADMIN_PUB_KEY=$(cat /proc/sys/kernel/random/uuid)
    ADMIN_PRIV_KEY=$(cat /proc/sys/kernel/random/uuid)
    SUPERADMIN_PUB_KEY=$(cat /proc/sys/kernel/random/uuid)
    SUPERADMIN_PRIV_KEY=$(cat /proc/sys/kernel/random/uuid)
    RABBITMQ_PUB_KEY=$(cat /proc/sys/kernel/random/uuid)
    RABBITMQ_PRIV_KEY=$(cat /proc/sys/kernel/random/uuid)
    IMS_PUB_KEY=$(cat /proc/sys/kernel/random/uuid)
    IMS_PRIV_KEY=$(cat /proc/sys/kernel/random/uuid)
    SERVER_ID=$(cat /proc/sys/kernel/random/uuid)
elif [[ "$OSTYPE" == "darwin"* ]]; then
    ADMIN_PWD=$(uuidgen)
    ADMIN_PUB_KEY=$(uuidgen)
    ADMIN_PRIV_KEY=$(uuidgen)
    SUPERADMIN_PUB_KEY=$(uuidgen)
    SUPERADMIN_PRIV_KEY=$(uuidgen)
    RABBITMQ_PUB_KEY=$(uuidgen)
    RABBITMQ_PRIV_KEY=$(uuidgen)
    IMS_PUB_KEY=$(uuidgen)
    IMS_PRIV_KEY=$(uuidgen)
    SERVER_ID=$(uuidgen)
fi

KEYS=('ADMIN_PWD' 'ADMIN_PUB_KEY' 'ADMIN_PRIV_KEY' 'SUPERADMIN_PUB_KEY' 'SUPERADMIN_PRIV_KEY'
'RABBITMQ_PUB_KEY' 'RABBITMQ_PRIV_KEY' 'IMS_PUB_KEY' 'IMS_PRIV_KEY' 'SERVER_ID')
