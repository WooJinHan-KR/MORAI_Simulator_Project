# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "record: 1 messages, 1 services")

set(MSG_I_FLAGS "-Irecord:/home/ubuntu/morive_ws/src/record/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(record_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/morive_ws/src/record/msg/student.msg" NAME_WE)
add_custom_target(_record_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "record" "/home/ubuntu/morive_ws/src/record/msg/student.msg" ""
)

get_filename_component(_filename "/home/ubuntu/morive_ws/src/record/srv/AddTwoInts.srv" NAME_WE)
add_custom_target(_record_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "record" "/home/ubuntu/morive_ws/src/record/srv/AddTwoInts.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(record
  "/home/ubuntu/morive_ws/src/record/msg/student.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/record
)

### Generating Services
_generate_srv_cpp(record
  "/home/ubuntu/morive_ws/src/record/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/record
)

### Generating Module File
_generate_module_cpp(record
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/record
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(record_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(record_generate_messages record_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/morive_ws/src/record/msg/student.msg" NAME_WE)
add_dependencies(record_generate_messages_cpp _record_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/morive_ws/src/record/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(record_generate_messages_cpp _record_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(record_gencpp)
add_dependencies(record_gencpp record_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS record_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(record
  "/home/ubuntu/morive_ws/src/record/msg/student.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/record
)

### Generating Services
_generate_srv_eus(record
  "/home/ubuntu/morive_ws/src/record/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/record
)

### Generating Module File
_generate_module_eus(record
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/record
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(record_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(record_generate_messages record_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/morive_ws/src/record/msg/student.msg" NAME_WE)
add_dependencies(record_generate_messages_eus _record_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/morive_ws/src/record/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(record_generate_messages_eus _record_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(record_geneus)
add_dependencies(record_geneus record_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS record_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(record
  "/home/ubuntu/morive_ws/src/record/msg/student.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/record
)

### Generating Services
_generate_srv_lisp(record
  "/home/ubuntu/morive_ws/src/record/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/record
)

### Generating Module File
_generate_module_lisp(record
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/record
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(record_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(record_generate_messages record_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/morive_ws/src/record/msg/student.msg" NAME_WE)
add_dependencies(record_generate_messages_lisp _record_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/morive_ws/src/record/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(record_generate_messages_lisp _record_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(record_genlisp)
add_dependencies(record_genlisp record_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS record_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(record
  "/home/ubuntu/morive_ws/src/record/msg/student.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/record
)

### Generating Services
_generate_srv_nodejs(record
  "/home/ubuntu/morive_ws/src/record/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/record
)

### Generating Module File
_generate_module_nodejs(record
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/record
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(record_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(record_generate_messages record_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/morive_ws/src/record/msg/student.msg" NAME_WE)
add_dependencies(record_generate_messages_nodejs _record_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/morive_ws/src/record/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(record_generate_messages_nodejs _record_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(record_gennodejs)
add_dependencies(record_gennodejs record_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS record_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(record
  "/home/ubuntu/morive_ws/src/record/msg/student.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/record
)

### Generating Services
_generate_srv_py(record
  "/home/ubuntu/morive_ws/src/record/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/record
)

### Generating Module File
_generate_module_py(record
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/record
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(record_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(record_generate_messages record_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/morive_ws/src/record/msg/student.msg" NAME_WE)
add_dependencies(record_generate_messages_py _record_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/morive_ws/src/record/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(record_generate_messages_py _record_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(record_genpy)
add_dependencies(record_genpy record_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS record_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/record)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/record
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(record_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/record)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/record
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(record_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/record)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/record
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(record_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/record)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/record
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(record_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/record)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/record\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/record
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(record_generate_messages_py std_msgs_generate_messages_py)
endif()
