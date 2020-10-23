cmake_minimum_required(VERSION 3.18)
project(issue-demo VERSION 0.0.1
                  DESCRIPTION "Demo on how protobuf between mysql-conector and system clash"
                  LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)


set(Protobuf_USE_STATIC_LIBS ON)
find_package(Protobuf 3.13.0 REQUIRED)
include_directories(${Protobuf_INCLUDE_DIRS})
include_directories(${CMAKE_CURRENT_BINARY_DIR})
protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS foo.proto)

add_subdirectory(thirdparty)

add_executable(${PROJECT_NAME} src/main.cpp ${PROTO_SRCS} ${PROTO_HDRS})

target_link_libraries(${PROJECT_NAME}
    mysqlx-connector
    ${Protobuf_LIBRARIES}
)
