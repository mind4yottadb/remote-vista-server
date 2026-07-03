#################################################################
#                                                               #
# Copyright (c) 2026 DnaSoft B.V. and/or its subsidiaries.      #
# All rights reserved.                                          #
#                                                               #
#   This source code contains the intellectual property         #
#   of its copyright holder(s), and is made available           #
#   under a license.  If you do not know the terms of           #
#   the license, please stop and do not read further.           #
#                                                               #
#################################################################

FROM worldvista/vehu

# Extra's to run non-interactive Chrome
#RUN apt-get update && apt-get install -y curl unzip wget cmake git gcc make
			#libssl-dev libconfig-dev libgcrypt-dev libgpgme-dev \
			#libicu-dev libsodium-dev curl libcurl4-openssl-dev libnss3-tools libicu74

# install latest version of MIND server
ENV xxx=123
RUN cd /tmp && rm -rf remote-vista-server && git clone -b v0.0.1 --single-branch https://github.com/mind4yottadb/remote-vista-server.git && cd remote-vista-server && mkdir build && cd build && cmake .. && make && make install

# change default dir
WORKDIR /opt/yottadb/r2.02_x86_64/plugin/etc/mind


# to build the image
# docker image build --progress=plain -t mind-rvs .
