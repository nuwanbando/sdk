#!/bin/bash

# ----------------------------------------------------------------------------------
# Copyright (c) 2019, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
#
# WSO2 Inc. licenses this file to you under the Apache License,
# Version 2.0 (the "License"); you may not use this file except
# in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
# ----------------------------------------------------------------------------------
#
# Generate required artifacts for ballerina-runtime docker image creation

SOURCE_ROOT=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
BALLERINA_VERSION=0.991.0
BALLERINA_DEB_LOCATION=$SOURCE_ROOT/../../ballerina-linux-installer-x64-$BALLERINA_VERSION.deb

cd $SOURCE_ROOT

mkdir -p files
[ -f $BALLERINA_DEB_LOCATION ] || curl --retry 5 \
https://product-dist.ballerina.io/downloads/$BALLERINA_VERSION/ballerina-linux-installer-x64-$BALLERINA_VERSION.deb \
--output $BALLERINA_DEB_LOCATION

cp $BALLERINA_DEB_LOCATION files/
cp ../ubuntu-x64/target/cellery-ubuntu-x64-*.deb files/cellery-ubuntu-x64.deb
cp -r ../../components/lang/target/cellery-*.jar files/
