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
# BIAFLOWS configuration
#------------------------------------------------------------------------------

# These URLs have to be accessible (add them to /etc/hosts if you run it locally)
CORE_URL=localhost-core
IMS_URL1=localhost-ims
UPLOAD_URL=localhost-upload

# These paths must exist
IMS_STORAGE_PATH=/data/images
IMS_BUFFER_PATH=/data/_buffer
FAST_DATA_PATH=/data/images
SOFTWARE_DOCKER_IMAGES_PATH=/data/softwares/images
SERVER_SSHKEYS_PATH=/data/ssh

# Ask workflows to compute metrics and upload results to BIAFLOWS
BIAFLOWS_WORKFLOWS_METRICS=false

# Upload to BIAFLOWS resulting annotations produced by workflow executions
BIAFLOWS_WORKFLOWS_EXPORT=true

###############################################################################
###############################################################################
###############################################################################
#------------------------------------------------------------------------------
# ADVANCED CYTOMINE CONFIGURATION
# - Do not touch instead you know what you are doing.
#------------------------------------------------------------------------------


#------------------------------------------------------------------------------
# Core
#------------------------------------------------------------------------------
SENDER_EMAIL_SMTP_HOST='smtp.gmail.com'
SENDER_EMAIL_SMTP_PORT='587'
SENDER_EMAIL_PASS='passwd'
SENDER_EMAIL='your.email@gmail.com'

# Advanced configuration.
CORE_DEVELOPMENT=false

#------------------------------------------------------------------------------
# IMS
#------------------------------------------------------------------------------
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

#------------------------------------------------------------------------------
# PLUGIN: IIP-JP2 (JPEG 2000 native support)
#------------------------------------------------------------------------------
IIP_JP2_ENABLED=true

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

#------------------------------------------------------------------------------
# PLUGIN: SOFTWARE
#------------------------------------------------------------------------------
SOFTWARE_ENABLED=true
SOFTWARE_CODE_PATH=/data/softwares/code
JOBS_PATH=/data/jobs

# Advanced configuration.
RABBITMQ_LOGIN="router"
RABBITMQ_PASSWORD="router"
