include(FetchContent)

set(BUILD_STATIC ON)

FetchContent_Declare(
  mysql-connector
  GIT_REPOSITORY https://github.com/mysql/mysql-connector-cpp.git
  GIT_TAG        8.0.21
)

FetchContent_MakeAvailable(mysql-connector)

add_library(mysqlx-connector ALIAS connector)
