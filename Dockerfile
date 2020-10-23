FROM chanpl/gcc:9.3.0

ARG PROTOBUF_VERSION

# install dependencies
RUN apt update \
	&& apt clean all \
	&& rm -rf /var/cache/apt \
	&& find /var/log -type f | xargs rm -f \
	&& curl -L -o /tmp/protobuf.zip https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOBUF_VERSION}/protobuf-cpp-${PROTOBUF_VERSION}.zip \
	&& unzip /tmp/protobuf.zip -d /tmp \
	&& /tmp/protobuf-${PROTOBUF_VERSION}/configure \
	&& make -j4 \
	&& make install \
	&& ldconfig

# build
WORKDIR /app

COPY CMakeLists.txt foo.proto ./
COPY src ./src
COPY thirdparty ./thirdparty

# RUN mkdir build \
# 	&& cd build \
# 	&& cmake .. \
# 	&& make -j4
