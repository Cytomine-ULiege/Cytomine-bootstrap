#!/bin/bash

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

# Get all the config values.
. utils/files.sh
. utils/keys.sh
. configuration.sh
. configuration-versions.sh

# Fix container aliases for core/ims development
ALIASES=('POSTGRES_ALIAS' 'MONGODB_ALIAS' 'RABBITMQ_ALIAS' 'BIOFORMAT_ALIAS' 'CORE_ALIAS' 'IMS_ALIAS' 'IMS_PORT' 'WEB_UI_ALIAS' 'WEB_UI_PORT' 'HMS_ALIAS' 'HMS_PORT')
POSTGRES_ALIAS=postgresql
MONGODB_ALIAS=mongodb
RABBITMQ_ALIAS=rabbitmq
BIOFORMAT_ALIAS=bioformat
CORE_ALIAS=core
IMS_ALIAS=ims

IMS_PORT=8080 # docker
# IMS_PORT=9191 # dev

WEB_UI_ALIAS=webUI
WEB_UI_PORT=80 # docker
HMS_ALIAS=hms
HMS_PORT=8080 # docker

if [[ $CORE_DEVELOPMENT = true ]]; then
    POSTGRES_ALIAS=localhost
    MONGODB_ALIAS=localhost
    RABBITMQ_ALIAS=localhost
    CORE_ALIAS=172.17.0.1
fi
if [[ $IMS_DEVELOPMENT = true ]]; then
    BIOFORMAT_ALIAS=bioformat
    IMS_ALIAS=172.17.0.1
    IMS_PORT=9080
fi
if [[ $WEB_UI_DEVELOPMENT = true ]]; then
    WEB_UI_ALIAS=172.17.0.1
    WEB_UI_PORT=8081
fi
if [[ $BIOFORMAT_DEVELOPMENT = true ]]; then
    BIOFORMAT_ALIAS=172.17.0.1
fi
if [[ $HMS_DEVELOPMENT = true ]]; then
    HMS_ALIAS=172.17.0.1
    HMS_PORT=5000
fi


# Get variables in configuration.sh
VARIABLES=()
while read LINE; do
    if [[ $LINE == *"="* ]]; then
        IFS='=' read -ra ADDR <<< "$LINE"
        VARIABLES+=(${ADDR[0]})
    fi
done <<< "$(cat configuration.sh)"

# Get variables in configuration-versions.sh
while read LINE; do
    if [[ $LINE == *"="* ]]; then
        IFS='=' read -ra ADDR <<< "$LINE"
        VARIABLES+=(${ADDR[0]})
    fi
done  <<< "$(cat configuration-versions.sh)"

# Get variables from keys.sh
VARIABLES=("${VARIABLES[@]}" "${KEYS[@]}")

# Get variables from aliases
VARIABLES=("${VARIABLES[@]}" "${ALIASES[@]}")

# Replace variables by their value in all files given in $FILES
for i in ${FILES[@]}; do
    if [[ -f "$i.sample" ]]; then
        cp $i.sample $i
        for j in ${VARIABLES[@]}; do
            if [[ $j != *"IRIS_ADMIN"*"NAME"* ]]; then
                if [[ "$OSTYPE" == "linux-gnu" ]]; then
                    eval sed -i "s~\\\$$j~\$$j~g" $i
                elif [[ "$OSTYPE" == "darwin"* ]]; then
                    eval sed -i '' -e "s~\\\$$j~\$$j~g" $i && rm $i-e
                fi
            fi
        done

        if [[ "$OSTYPE" == "linux-gnu" ]]; then
            # Special treatment due to spaces in these variables
            sed -i "s~\$IRIS_ADMIN_NAME~$IRIS_ADMIN_NAME~g" $i
            sed -i "s~\$IRIS_ADMIN_ORGANIZATION_NAME~$IRIS_ADMIN_ORGANIZATION_NAME~g" $i
            sed -i "s~\${INSTANCE_PREFIX}~$INSTANCE_PREFIX~g" $i

            # Remove links of not used containers
            if [[ $IRIS_ENABLED = false ]]; then sed -i "/--link ${INSTANCE_PREFIX}iris:iris/d" $i; fi
            if [[ $RETRIEVAL_ENABLED = false ]]; then sed -i "/--link ${INSTANCE_PREFIX}retrieval:retrieval/d" $i; fi
            if [[ $BIOFORMAT_ENABLED = false ]]; then sed -i "/--link ${INSTANCE_PREFIX}bioformat:bioformat/d" $i; fi
            if [[ $IIP_JP2_ENABLED = false ]]; then sed -i "/--link ${INSTANCE_PREFIX}iipJP2:iipJP2/d" $i; fi
            if [[ $SOFTWARE_ENABLED = false ]]; then sed -i "/--link ${INSTANCE_PREFIX}rabbitmq:rabbitmq/d" $i; fi
            if [[ $HMS_ENABLED = false ]]; then sed -i "/--link ${INSTANCE_PREFIX}hms:hms/d" $i; fi

            # Remove bindings to container CORE for core development
            if [[ $CORE_DEVELOPMENT = true ]]; then
                sed -i "/--link ${INSTANCE_PREFIX}core:core/d" $i
            else
                sed -i "/-p 5672:5672 -p 15672:15672/d" $i
                sed -i "/-p 5432:5432/d" $i
                sed -i "/-p 27017:27017 -p 28017:28017/d" $i
                sed -i "/-p 10022:22/d" $i
                sed -i "/-p 22/d" $i
            fi

            # Remove bindings to container IMS for ims development
            if [[ $IMS_DEVELOPMENT = true ]]; then
                sed -i "/--link ${INSTANCE_PREFIX}ims:ims/d" $i;
            fi

            # Remove bindings to container webUI for webUi development
            if [[ $WEB_UI_DEVELOPMENT = true ]]; then
                sed -i "/--link ${INSTANCE_PREFIX}webUI:webUI/d" $i;
            else
                sed -i "/include \/usr\/local\/nginx\/conf\/web-ui-dev-cors.conf;/d" $i;
            fi

            # Remove bindings to container Bioformat for bioformat developement
            if [[ $BIOFORMAT_DEVELOPMENT = true ]]; then
                sed -i "/--link ${INSTANCE_PREFIX}bioformat:bioformat/d" $i;
            fi

            if [[ $HMS_DEVELOPMENT = true ]]; then
                sed -i "/--link ${INSTANCE_PREFIX}hms:hms/d" $i;
            fi

            # Remove ssl in nginx config if http is used as protocol
            if [[ $HTTP_PROTOCOL == "http" || $HTTP_PROXY = true ]]; then
                sed -i "/ssl_/d" $i;
                sed -i "/443 ssl/d" $i;
                sed -i "/-v ${CERTIFICATE_PATH//\//\\/}:\/certificates/d" $i;
            fi

            if [[ $HTTP_PROTOCOL == "https" ]]; then
              sed -i "/$IMS_URL\" >> \/etc\/hosts/d" $i;
              sed -i "/$CORE_URL\" >> \/etc\/hosts/d" $i;
              sed -i "/$UPLOAD_URL\" >> \/etc\/hosts/d" $i;
            fi

        # For Mac OS, the sed command is interpreted differently
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i '' -e "/-v \/etc\/localtime:\/etc\/localtime/d" $i
            sed -i '' -e "s~\${INSTANCE_PREFIX}~$INSTANCE_PREFIX~g" $i

            # Special treatment due to spaces in these variables
            sed -i '' -e "s~\$IRIS_ADMIN_NAME~$IRIS_ADMIN_NAME~g" $i
            sed -i '' -e "s~\$IRIS_ADMIN_ORGANIZATION_NAME~$IRIS_ADMIN_ORGANIZATION_NAME~g" $i

            # Remove links of not used containers
            if [[ $IRIS_ENABLED = false ]]; then sed -i '' -e "/--link ${INSTANCE_PREFIX}iris:iris/d" $i; fi
            if [[ $RETRIEVAL_ENABLED = false ]]; then sed -i '' -e "/--link ${INSTANCE_PREFIX}retrieval:retrieval/d" $i; fi
            if [[ $BIOFORMAT_ENABLED = false ]]; then sed -i '' -e "/--link ${INSTANCE_PREFIX}bioformat:bioformat/d" $i; fi
            if [[ $IIP_JP2_ENABLED = false ]]; then sed -i '' -e "/--link ${INSTANCE_PREFIX}iipJP2:iipJP2/d" $i; fi
            if [[ $SOFTWARE_ENABLED = false ]]; then sed -i '' -e "/--link ${INSTANCE_PREFIX}rabbitmq:rabbitmq/d" $i; fi
            if [[ $HMS_ENABLED = false ]]; then sed -i '' -e "/--link ${INSTANCE_PREFIX}hms:hms/d" $i; fi

            # Remove bindings to container CORE for core development
            if [[ $CORE_DEVELOPMENT = true ]]; then 
                sed -i '' -e "/--link ${INSTANCE_PREFIX}core:core/d" $i
            else
                sed -i '' -e "/-p 5672:5672 -p 15672:15672/d" $i
                sed -i '' -e "/-p 5432:5432/d" $i
                sed -i '' -e "/-p 27017:27017 -p 28017:28017/d" $i
                sed -i '' -e "/-p 10022:22/d" $i
                sed -i '' -e "/-p 22/d" $i
            fi

            # Remove bindings to container IMS for ims development
            if [[ $IMS_DEVELOPMENT = true ]]; then
                sed -i '' -e "/--link ${INSTANCE_PREFIX}ims:ims/d" $i;
            fi

            # Remove bindings to container webUI for webUi development
            if [[ $WEB_UI_DEVELOPMENT = true ]]; then
                sed -i '' -e "/--link ${INSTANCE_PREFIX}webUI:webUI/d" $i;
            else
                sed -i '' -e "/include \/usr\/local\/nginx\/conf\/web-ui-dev-cors.conf;/d" $i;
            fi

            # Remove bindings to container Bioformat for bioformat developement
            if [[ $BIOFORMAT_DEVELOPMENT = true ]]; then
                sed -i '' -e "/--link ${INSTANCE_PREFIX}bioformat:bioformat/d" $i;
            fi

            if [[ $HMS_DEVELOPMENT = true ]]; then
                sed -i '' -e "/--link ${INSTANCE_PREFIX}hms:hms/d" $i;
            fi

            # Remove ssl in nginx config if http is used as protocol
            if [[ $HTTP_PROTOCOL == "http" || $HTTP_PROXY = true ]]; then
                sed -i '' -e "/ssl_/d" $i;
                sed -i '' -e "/443 ssl/d" $i;
                sed -i '' -e "/-v ${CERTIFICATE_PATH//\//\\/}:\/certificates/d" $i;
            fi

            if [[ $HTTP_PROTOCOL == "https" ]]; then
              sed -i '' -e "/$IMS_URL\" >> \/etc\/hosts/d" $i;
              sed -i '' -e "/$CORE_URL\" >> \/etc\/hosts/d" $i;
              sed -i '' -e "/$UPLOAD_URL\" >> \/etc\/hosts/d" $i;
            fi
        fi
    fi
done

# Move the created start.sh to the root directory.
mv utils/start.sh ./start.sh
