# CMake generated Testfile for 
# Source directory: C:/projects/rb-chrome/nanomsg-0.5-beta
# Build directory: C:/projects/rb-chrome/nanomsg-0.5-beta/win
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(inproc "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/inproc.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(inproc "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/inproc.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(inproc "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/inproc.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(inproc "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/inproc.exe")
else()
  add_test(inproc NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(inproc_shutdown "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/inproc_shutdown.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(inproc_shutdown "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/inproc_shutdown.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(inproc_shutdown "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/inproc_shutdown.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(inproc_shutdown "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/inproc_shutdown.exe")
else()
  add_test(inproc_shutdown NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(ipc "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/ipc.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(ipc "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/ipc.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(ipc "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/ipc.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(ipc "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/ipc.exe")
else()
  add_test(ipc NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(ipc_shutdown "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/ipc_shutdown.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(ipc_shutdown "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/ipc_shutdown.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(ipc_shutdown "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/ipc_shutdown.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(ipc_shutdown "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/ipc_shutdown.exe")
else()
  add_test(ipc_shutdown NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(ipc_stress "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/ipc_stress.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(ipc_stress "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/ipc_stress.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(ipc_stress "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/ipc_stress.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(ipc_stress "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/ipc_stress.exe")
else()
  add_test(ipc_stress NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(tcp "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/tcp.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(tcp "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/tcp.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(tcp "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/tcp.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(tcp "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/tcp.exe")
else()
  add_test(tcp NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(tcp_shutdown "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/tcp_shutdown.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(tcp_shutdown "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/tcp_shutdown.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(tcp_shutdown "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/tcp_shutdown.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(tcp_shutdown "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/tcp_shutdown.exe")
else()
  add_test(tcp_shutdown NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(pair "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/pair.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(pair "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/pair.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(pair "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/pair.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(pair "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/pair.exe")
else()
  add_test(pair NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(pubsub "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/pubsub.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(pubsub "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/pubsub.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(pubsub "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/pubsub.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(pubsub "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/pubsub.exe")
else()
  add_test(pubsub NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(reqrep "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/reqrep.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(reqrep "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/reqrep.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(reqrep "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/reqrep.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(reqrep "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/reqrep.exe")
else()
  add_test(reqrep NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(pipeline "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/pipeline.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(pipeline "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/pipeline.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(pipeline "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/pipeline.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(pipeline "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/pipeline.exe")
else()
  add_test(pipeline NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(survey "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/survey.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(survey "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/survey.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(survey "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/survey.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(survey "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/survey.exe")
else()
  add_test(survey NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(bus "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/bus.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(bus "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/bus.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(bus "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/bus.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(bus "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/bus.exe")
else()
  add_test(bus NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(block "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/block.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(block "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/block.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(block "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/block.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(block "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/block.exe")
else()
  add_test(block NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(term "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/term.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(term "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/term.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(term "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/term.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(term "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/term.exe")
else()
  add_test(term NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(timeo "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/timeo.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(timeo "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/timeo.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(timeo "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/timeo.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(timeo "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/timeo.exe")
else()
  add_test(timeo NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(iovec "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/iovec.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(iovec "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/iovec.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(iovec "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/iovec.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(iovec "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/iovec.exe")
else()
  add_test(iovec NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(msg "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/msg.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(msg "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/msg.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(msg "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/msg.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(msg "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/msg.exe")
else()
  add_test(msg NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(prio "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/prio.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(prio "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/prio.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(prio "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/prio.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(prio "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/prio.exe")
else()
  add_test(prio NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(poll "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/poll.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(poll "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/poll.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(poll "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/poll.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(poll "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/poll.exe")
else()
  add_test(poll NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(device "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/device.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(device "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/device.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(device "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/device.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(device "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/device.exe")
else()
  add_test(device NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(emfile "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/emfile.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(emfile "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/emfile.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(emfile "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/emfile.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(emfile "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/emfile.exe")
else()
  add_test(emfile NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(domain "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/domain.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(domain "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/domain.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(domain "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/domain.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(domain "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/domain.exe")
else()
  add_test(domain NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(trie "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/trie.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(trie "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/trie.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(trie "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/trie.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(trie "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/trie.exe")
else()
  add_test(trie NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(list "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/list.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(list "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/list.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(list "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/list.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(list "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/list.exe")
else()
  add_test(list NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(hash "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/hash.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(hash "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/hash.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(hash "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/hash.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(hash "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/hash.exe")
else()
  add_test(hash NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(symbol "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/symbol.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(symbol "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/symbol.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(symbol "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/symbol.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(symbol "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/symbol.exe")
else()
  add_test(symbol NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(separation "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/separation.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(separation "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/separation.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(separation "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/separation.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(separation "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/separation.exe")
else()
  add_test(separation NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(zerocopy "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/zerocopy.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(zerocopy "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/zerocopy.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(zerocopy "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/zerocopy.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(zerocopy "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/zerocopy.exe")
else()
  add_test(zerocopy NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(shutdown "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/shutdown.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(shutdown "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/shutdown.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(shutdown "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/shutdown.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(shutdown "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/shutdown.exe")
else()
  add_test(shutdown NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(cmsg "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Debug/cmsg.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(cmsg "C:/projects/rb-chrome/nanomsg-0.5-beta/win/Release/cmsg.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(cmsg "C:/projects/rb-chrome/nanomsg-0.5-beta/win/MinSizeRel/cmsg.exe")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(cmsg "C:/projects/rb-chrome/nanomsg-0.5-beta/win/RelWithDebInfo/cmsg.exe")
else()
  add_test(cmsg NOT_AVAILABLE)
endif()
subdirs(src)