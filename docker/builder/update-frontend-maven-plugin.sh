#!/bin/sh
#
# Copyright 2015-2020 The OpenZipkin Authors
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
# in compliance with the License. You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License
# is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
# or implied. See the License for the specific language governing permissions and limitations under
# the License.
#

# This updates the frontend-maven-plugin to support Alpine until the below is merged and released
# See https://github.com/eirslett/frontend-maven-plugin/pull/934
set -eux

apk add --no-cache git
git clone https://github.com/adriancole/frontend-maven-plugin.git
cd frontend-maven-plugin
git checkout alpine
mvn -q --batch-mode install -DskipTests
cd -
rm -rf frontend-maven-plugin
apk del git
