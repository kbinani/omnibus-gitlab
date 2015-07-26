#
# Copyright:: Copyright (c) 2014 GitLab B.V.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "system-shared-libs"

build do
  libs = [
    "libc",
    "libdl",
    "libpthread",
    "libm",
    "libresolv",
    "libgcc_s",
    "librt",
    "libutil",
    "libnsl",
    "libfreebl3",
    "libcrypt",
    "libcom_err",
    "libkeyutils",
    "libselinux",
  ]
  libs.each { |lib|
    command "cp -d /lib64/#{lib}.* #{install_dir}/embedded/lib/"
    command "cp -d /lib64/#{lib}-* #{install_dir}/embedded/lib/ || true"
  }
  userlibs = [
    "libstdc++",
    "libssl",
    "libcrypto",
  ]
  userlibs.each { |lib|
    command "cp -d /usr/lib64/#{lib}.* #{install_dir}/embedded/lib/"
    command "cp -d /usr/lib64/#{lib}-* #{install_dir}/embedded/lib/ || true"
  }
end
