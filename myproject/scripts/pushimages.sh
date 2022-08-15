#!/usr/bin/env bash
#   Copyright IBM Corporation 2020
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

# Invoke as pushimages.sh <registry_url> <registry_namespace>

if [ "$#" -ne 2 ]; then
    REGISTRY_URL=quay.io
    REGISTRY_NAMESPACE=jefrankl
else
    REGISTRY_URL=$1
    REGISTRY_NAMESPACE=$2
fi

# Uncomment the below line if you want to enable login before pushing
# podman login ${REGISTRY_URL}

podman tag aspnetapp-dotnetwebbuildstage ${REGISTRY_URL}/${REGISTRY_NAMESPACE}/aspnetapp-dotnetwebbuildstage
podman push ${REGISTRY_URL}/${REGISTRY_NAMESPACE}/aspnetapp-dotnetwebbuildstage
podman tag awesome-compose ${REGISTRY_URL}/${REGISTRY_NAMESPACE}/awesome-compose
podman push ${REGISTRY_URL}/${REGISTRY_NAMESPACE}/awesome-compose

