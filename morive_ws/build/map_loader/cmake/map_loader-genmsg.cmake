# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "map_loader: 1 messages, 1 services")

set(MSG_I_FLAGS "-Imap_loader:/home/ubuntu/morive_ws/src/map_loader/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(map_loader_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/morive_ws/src/map_loader/msg/student.msg" NAME_WE)
add_custom_target(_map_loader_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "map_loader" "/home/ubuntu/morive_ws/src/map_loader/msg/student.msg" ""
)

get_filename_component(_filename "/home/ubuntu/morive_ws/src/map_loader/srv/AddTwoInts.srv" NAME_WE)
add_custom_target(_map_loader_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "map_loader" "/home/ubuntu/morive_ws/src/map_loader/srv/AddTwoInts.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(map_loader
  "/home/ubuntu/morive_ws/src/map_loader/msg/student.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_loader
)

### Generating Services
_generate_srv_cpp(map_loader
  "/home/ubuntu/morive_ws/src/map_loader/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_loader
)

### Generating Module File
_generate_module_cpp(map_loader
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_loader
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(map_loader_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(map_loader_generate_messages map_loader_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/morive_ws/src/map_loader/msg/student.msg" NAME_WE)
add_dependencies(map_loader_generate_messages_cpp _map_loader_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/morive_ws/src/map_loader/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(map_loader_generate_messages_cpp _map_loader_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(map_loader_gencpp)
add_dependencies(map_loader_gencpp map_loader_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS map_loader_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(map_loader
  "/home/ubuntu/morive_ws/src/map_loader/msg/student.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/map_loader
)

### Generating Services
_generate_srv_eus(map_loader
  "/home/ubuntu/morive_ws/src/map_loader/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/map_loader
)

### Generating Module File
_generate_module_eus(map_loader
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/map_loader
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(map_loader_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(map_loader_generate_messages map_loader_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/morive_ws/src/map_loader/msg/student.msg" NAME_WE)
add_dependencies(map_loader_generate_messages_eus _map_loader_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/morive_ws/src/map_loader/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(map_loader_generate_messages_eus _map_loader_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(map_loader_geneus)
add_dependencies(map_loader_geneus map_loader_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS map_loader_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(map_loader
  "/home/ubuntu/morive_ws/src/map_loader/msg/student.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_loader
)

### Generating Services
_generate_srv_lisp(map_loader
  "/home/ubuntu/morive_ws/src/map_loader/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_loader
)

### Generating Module File
_generate_module_lisp(map_loader
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_loader
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(map_loader_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(map_loader_generate_messages map_loader_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/morive_ws/src/map_loader/msg/student.msg" NAME_WE)
add_dependencies(map_loader_generate_messages_lisp _map_loader_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/morive_ws/src/map_loader/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(map_loader_generate_messages_lisp _map_loader_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(map_loader_genlisp)
add_dependencies(map_loader_genlisp map_loader_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS map_loader_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(map_loader
  "/home/ubuntu/morive_ws/src/map_loader/msg/student.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/map_loader
)

### Generating Services
_generate_srv_nodejs(map_loader
  "/home/ubuntu/morive_ws/src/map_loader/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/map_loader
)

### Generating Module File
_generate_module_nodejs(map_loader
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/map_loader
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(map_loader_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(map_loader_generate_messages map_loader_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/morive_ws/src/map_loader/msg/student.msg" NAME_WE)
add_dependencies(map_loader_generate_messages_nodejs _map_loader_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/morive_ws/src/map_loader/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(map_loader_generate_messages_nodejs _map_loader_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(map_loader_gennodejs)
add_dependencies(map_loader_gennodejs map_loader_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS map_loader_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(map_loader
  "/home/ubuntu/morive_ws/src/map_loader/msg/student.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_loader
)

### Generating Services
_generate_srv_py(map_loader
  "/home/ubuntu/morive_ws/src/map_loader/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_loader
)

### Generating Module File
_generate_module_py(map_loader
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_loader
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(map_loader_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(map_loader_generate_messages map_loader_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/morive_ws/src/map_loader/msg/student.msg" NAME_WE)
add_dependencies(map_loader_generate_messages_py _map_loader_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/morive_ws/src/map_loader/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(map_loader_generate_messages_py _map_loader_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(map_loader_genpy)
add_dependencies(map_loader_genpy map_loader_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS map_loader_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_loader)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_loader
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(map_loader_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/map_loader)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/map_loader
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(map_loader_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_loader)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_loader
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(map_loader_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/map_loader)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/map_loader
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(map_loader_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_loader)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_loader\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_loader
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(map_loader_generate_messages_py std_msgs_generate_messages_py)
endif()
