#################################################################
#                                                               #
# Copyright (c) 2025-2026 DnaSoft B.V. and/or its subsidiaries. #
# All rights reserved.                                          #
#                                                               #
#   This source code contains the intellectual property         #
#   of its copyright holder(s), and is made available           #
#   under a license.  If you do not know the terms of           #
#   the license, please stop and do not read further.           #
#                                                               #
#################################################################
# Prelim
cmake_minimum_required(VERSION 3.14)
include(FetchContent)
# The GIT_TAG below is, at the time of this writing, the latest commit in YDBCMake.
# It is fixed at that point to ensure reproducible builds.
# Keep this periodically up to date with future YDBCMake commits.
FetchContent_Declare(YDBCMake
	GIT_REPOSITORY	https://gitlab.com/YottaDB/Tools/YDBCMake.git
	GIT_TAG		1bf25f1a14c82e8348a024fb105a2e44e0645f9d
)

# The following sets ydbcmake_SOURCE_DIR
FetchContent_MakeAvailable(YDBCMake)
message(STATUS "YDBCMake Source Directory: ${ydbcmake_SOURCE_DIR}")
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${ydbcmake_SOURCE_DIR}/ydbcmake/")

project(remote-vista-server
	LANGUAGES M
	VERSION 0.0.1)
find_package(YOTTADB REQUIRED)

if(EXISTS "${YOTTADB_M_PLUGIN_DIR}/_mind.so")
	message(STATUS "Found MIND server: ${YOTTADB_M_PLUGIN_DIR}/_mind.so")
else()
	FetchContent_Declare(mind-server
		GIT_REPOSITORY https://github.com/mind4yottadb/mind-server.git
		GIT_TAG        main
	)
	FetchContent_MakeAvailable(mind-server)
endif()

message(STATUS "Install Location: ${YOTTADB_M_PLUGIN_DIR}")

#configure_file(src/server/m/_mindVersion.m src/server/m/init/_mindVersion.m @ONLY)
#configure_file(_mind.manifest.json ${CMAKE_CURRENT_BINARY_DIR}/_mind.manifest.json @ONLY)

set(source_files
	config/rvs/_mindRvsContextManager.m
	config/rvs/_mindRvsEntryPoints.m
	config/rvs/_mindRvsHooks.m
	config/rvs/_mindRvsLogin.m
	config/rvs/_mindRvsVistaCaller.m
	config/rvs/VistaRpc.m
)

# .so file for plugin
add_ydb_library(remote-vista-server SOURCES ${source_files})

# Install shared library
install_ydb_library(remote-vista-server)

install(FILES config/mind.conf DESTINATION ${YOTTADB_PLUGIN_PREFIX}/etc/mind)
install(FILES config/users.json DESTINATION ${YOTTADB_PLUGIN_PREFIX}/etc/mind)

install(FILES config/mind-vista DESTINATION ${YOTTADB_PLUGIN_PREFIX}/etc/mind PERMISSIONS OWNER_EXECUTE)
#install(FILES commands/mind-vehu-vista DESTINATION ${YOTTADB_PLUGIN_PREFIX}/etc/mind PERMISSIONS OWNER_EXECUTE)
install(FILES config/rvs/remote-vista.json DESTINATION ${YOTTADB_PLUGIN_PREFIX}/etc/mind/rvs)

# copy the manifest file to the plugin dir
#install(FILES ${CMAKE_CURRENT_BINARY_DIR}/_mind.manifest.json DESTINATION ${YOTTADB_M_PLUGIN_DIR})
#if(ydb_icu_version)
#	install(FILES ${CMAKE_CURRENT_BINARY_DIR}/_mind.manifest.json DESTINATION ${YOTTADB_M_PLUGIN_DIR}/utf8)
#endif()
