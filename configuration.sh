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



# -----------------------------------------------------------------------------
# Check Cytomine configuration reference for details:
# > https://doc.cytomine.be/display/PubOp/Cytomine+configuration+reference
#
# Advanced configuration should be edited only if you know what you are doing.
# -----------------------------------------------------------------------------



#------------------------------------------------------------------------------
# CORE
#------------------------------------------------------------------------------
UI_URL=cytomine-snuhpia.ddns.net
CORE_URL=cytomine-snuhpia.ddns.net
SENDER_EMAIL_SMTP_HOST='smtp.gmail.com'
SENDER_EMAIL_SMTP_PORT='587'
SENDER_EMAIL_PASS='passwd'
SENDER_EMAIL='your.email@gmail.com'
ATTACHED_FILES_PATH=/data/attached

# Advanced configuration.
CORE_DEVELOPMENT=false
POSTGRESQL_VOLUME=db_postgres11
MONGODB_VOLUME=db_mongo

WEB_UI_DEVELOPMENT=false
#------------------------------------------------------------------------------
# IMS
#------------------------------------------------------------------------------
IMS_URL=cytomineims-b1.ddns.net
UPLOAD_URL=cytomineupload-b1.ddns.net

IMS_STORAGE_PATH=/data/images
IMS_BUFFER_PATH=/tmp/uploaded
FAST_DATA_PATH=/data/images
PROXY_CACHE_PATH=/data/cache

# Advanced configuration.
IMS_DEVELOPMENT=false

IIP_OFF_URL=localhost-iip-cyto
IIP_CYTO_URL=localhost-iip-cyto
MEMCACHED_PASS="mypass"
NB_IIP_PROCESS=10

#------------------------------------------------------------------------------
# PLUGIN: BACKUP
#------------------------------------------------------------------------------
BACKUP_ENABLED=false
RECEIVER_EMAIL='receiver@XXX.com'
BACKUP_PATH=/data/backup

#------------------------------------------------------------------------------
# PLUGIN: RETRIEVAL
#------------------------------------------------------------------------------
RETRIEVAL_ENABLED=false
RETRIEVAL_URL=localhost-retrieval
RETRIEVAL_PATH=/data/thumb

# Advanced configuration.
RETRIEVAL_PASSWORD='retrieval_default'
RETRIEVAL_ENGINE=redis #possible values : memory, redis

#------------------------------------------------------------------------------
# PLUGIN: BIOFORMAT
#------------------------------------------------------------------------------
BIOFORMAT_ENABLED=true
BIOFORMAT_DEVELOPMENT=false

#------------------------------------------------------------------------------
# PLUGIN: HMS
#------------------------------------------------------------------------------
HMS_ENABLED=true
HMS_DEVELOPMENT=false
HMS_URL=localhost-hms

#------------------------------------------------------------------------------
# PLUGIN: IIP-JP2 (JPEG 2000 native support)
#------------------------------------------------------------------------------
IIP_JP2_ENABLED=false

# Advanced configuration.
IIP_JP2_URL=localhost-iip-jp2000

#------------------------------------------------------------------------------
# PLUGIN: IRIS
#------------------------------------------------------------------------------
IRIS_ENABLED=false
IRIS_URL=localhost-iris
IRIS_ADMIN_NAME="Ian Admin"
IRIS_ADMIN_ORGANIZATION_NAME="University of Somewhere, Department of Whatever"
IRIS_ADMIN_EMAIL="ian.admin@somewhere.edu"

# Advanced configuration.
IRIS_ID="LOCAL_CYTOMINE_IRIS"
IRIS_VOLUME=iris_data

#------------------------------------------------------------------------------
# PLUGIN: SOFTWARE
#------------------------------------------------------------------------------
SOFTWARE_ENABLED=true
SOFTWARE_CODE_PATH=/data/softwares/code
SOFTWARE_DOCKER_IMAGES_PATH=/data/softwares/images
JOBS_PATH=/data/jobs
SERVER_SSHKEYS_PATH=/data/ssh

# Advanced configuration.
RABBITMQ_LOGIN="router"
RABBITMQ_PASSWORD="router"
SLURM_VOLUME=slurm_data

#-------------------------------------------------------------------------------
# HTTPS FOR PUBLIC URLS
#-------------------------------------------------------------------------------

# Protocol for URLs accessible from outside (CORE_URL, IMS_URL, UPLOAD_URL, IRIS_URL)
HTTP_PROTOCOL=http # Accepted values: http, https
HTTP_PROXY=false

# Path where certificates are stored:
CERTIFICATE_PATH=/data/certificates

# To use HTTPS protocol, you need the following certificates in your CERTIFICATE_PATH
# - ${CORE_URL}.pem (ex: localhost-core.pem)
# - ${CORE_URL}-key.pem (ex: localhost-core-key.pem)
# - ${IMS_URL}.pem
# - ${IMS_URL}-key.pem
# - ${UPLOAD_URL}.pem
# - ${UPLOAD_URL}-key.pem
# - ${IRIS_URL}.pem - only if $IRIS_ENABLED = true
# - ${IRIS_URL}-key.pem - only if $IRIS_ENABLED = true

INSTANCE_PREFIX=""
HTTP_NGINX_PORT=10080  # Must match the port appended to cytomine-* URLs
HTTPS_NGINX_PORT=9143  # docker