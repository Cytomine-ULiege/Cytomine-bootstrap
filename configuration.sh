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
UI_URL=localhost-core
CORE_URL=localhost-core
SENDER_EMAIL_SMTP_HOST='smtp.gmail.com'
SENDER_EMAIL_SMTP_PORT='587'
SENDER_EMAIL_PASS='passwd'
SENDER_EMAIL='your.email@gmail.com'
ADMIN_EMAIL='info@cytomine.coop'
ATTACHED_FILES_PATH=/data/attached

# Advanced configuration.
CORE_DEVELOPMENT=false
POSTGRESQL_VOLUME=db_postgres11_spring
MONGODB_VOLUME=db_mongo_spring

WEB_UI_DEVELOPMENT=false
#------------------------------------------------------------------------------
# (P)IMS
#------------------------------------------------------------------------------
IMS_URL=localhost-ims
UPLOAD_URL=localhost-upload

IMS_STORAGE_PATH=/data/images
IMS_BUFFER_PATH=/tmp/uploaded

# Advanced configuration.
IMS_DEVELOPMENT=false

PIMS_CACHE_ENABLED=true
PIMS_TASK_QUEUE_ENABLED=false

PIMS_WEB_CONCURRENCY=2  # Replace $NB_IIP_PROCESS
PIMS_WORKER_WEB_CONCURRENCY=1

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
SLURM_VOLUME=slurm_data_spring
GITHUB_USERNAME=""
GITHUB_TOKEN=""
DOCKERHUB_USERNAME=""
DOCKERHUB_PASSWORD=""

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
HTTP_NGINX_PORT=80
HTTPS_NGINX_PORT=443