# Install script for directory: C:/projects/lamina/dev/apr-1.5.1

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/APR")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/projects/lamina/dev/apr-1.5.1/win/Debug/libapr-1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/projects/lamina/dev/apr-1.5.1/win/Release/libapr-1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/projects/lamina/dev/apr-1.5.1/win/MinSizeRel/libapr-1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/projects/lamina/dev/apr-1.5.1/win/RelWithDebInfo/libapr-1.lib")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/projects/lamina/dev/apr-1.5.1/win/Debug/libapr-1.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/projects/lamina/dev/apr-1.5.1/win/Release/libapr-1.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/projects/lamina/dev/apr-1.5.1/win/MinSizeRel/libapr-1.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/projects/lamina/dev/apr-1.5.1/win/RelWithDebInfo/libapr-1.dll")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/projects/lamina/dev/apr-1.5.1/win/Debug/apr-1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/projects/lamina/dev/apr-1.5.1/win/Release/apr-1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/projects/lamina/dev/apr-1.5.1/win/MinSizeRel/apr-1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/projects/lamina/dev/apr-1.5.1/win/RelWithDebInfo/apr-1.lib")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/projects/lamina/dev/apr-1.5.1/win/Debug/libaprapp-1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/projects/lamina/dev/apr-1.5.1/win/Release/libaprapp-1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/projects/lamina/dev/apr-1.5.1/win/MinSizeRel/libaprapp-1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/projects/lamina/dev/apr-1.5.1/win/RelWithDebInfo/libaprapp-1.lib")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/projects/lamina/dev/apr-1.5.1/win/Debug/aprapp-1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/projects/lamina/dev/apr-1.5.1/win/Release/aprapp-1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/projects/lamina/dev/apr-1.5.1/win/MinSizeRel/aprapp-1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/projects/lamina/dev/apr-1.5.1/win/RelWithDebInfo/aprapp-1.lib")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo]|[Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE FILES "C:/projects/lamina/dev/apr-1.5.1/win/libapr-1.pdb")
  endif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo]|[Dd][Ee][Bb][Uu][Gg])$")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo]|[Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE FILE FILES
      "C:/projects/lamina/dev/apr-1.5.1/win/apr-1.pdb"
      "C:/projects/lamina/dev/apr-1.5.1/win/libaprapp-1.pdb"
      "C:/projects/lamina/dev/apr-1.5.1/win/aprapp-1.pdb"
      )
  endif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo]|[Dd][Ee][Bb][Uu][Gg])$")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_allocator.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_atomic.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_dso.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_env.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_errno.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_escape.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_file_info.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_file_io.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_fnmatch.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_general.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_getopt.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_global_mutex.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_hash.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_inherit.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_lib.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_mmap.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_network_io.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_poll.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_pools.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_portable.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_proc_mutex.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_random.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_ring.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_shm.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_signal.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_skiplist.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_strings.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_support.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_tables.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_thread_cond.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_thread_mutex.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_thread_proc.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_thread_rwlock.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_time.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_user.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_version.h"
    "C:/projects/lamina/dev/apr-1.5.1/include/apr_want.h"
    "C:/projects/lamina/dev/apr-1.5.1/win/apr.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

file(WRITE "C:/projects/lamina/dev/apr-1.5.1/win/${CMAKE_INSTALL_MANIFEST}" "")
foreach(file ${CMAKE_INSTALL_MANIFEST_FILES})
  file(APPEND "C:/projects/lamina/dev/apr-1.5.1/win/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
endforeach()
