# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "lateral_controller: 1 messages, 1 services")

set(MSG_I_FLAGS "-Ilateral_controller:/home/ubuntu/morive_ws/src/lateral_controller/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(lateral_controller_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/morive_ws/src/lateral_controller/msg/student.msg" NAME_WE)
add_custom_target(_lateral_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lateral_controller" "/home/ubuntu/morive_ws/src/lateral_controller/msg/student.msg" ""
)

get_filename_component(_filename "/home/ubuntu/morive_ws/src/lateral_controller/srv/AddTwoInts.srv" NAME_WE)
add_custom_target(_lateral_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lateral_controller" "/home/ubuntu/morive_ws/src/lateral_controller/srv/AddTwoInts.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(lateral_controller
  "/home/ubuntu/morive_ws/src/lateral_controller/msg/student.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lateral_controller
)

### Generating Services
_generate_srv_cpp(lateral_controller
  "/home/ubuntu/morive_ws/src/lateral_controller/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lateral_controller
)

### Generating Module File
_generate_module_cpp(lateral_controller
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lateral_controller
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(lateral_controller_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(lateral_controller_generate_messages lateral_controller_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/morive_ws/src/lateral_controller/msg/student.msg" NAME_WE)
add_dependencies(lateral_controller_generate_messages_cpp _lateral_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/morive_ws/src/lateral_controller/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(lateral_controller_generate_messages_cpp _lateral_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lateral_controller_gencpp)
add_dependencies(lateral_controller_gencpp lateral_controller_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lateral_controller_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(lateral_controller
  "/home/ubuntu/morive_ws/src/lateral_controller/msg/student.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lateral_controller
)

### Generating Services
_generate_srv_eus(lateral_controller
  "/home/ubuntu/morive_ws/src/lateral_controller/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lateral_controller
)

### Generating Module File
_generate_module_eus(lateral_controller
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lateral_controller
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(lateral_controller_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(lateral_controller_generate_messages lateral_controller_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/morive_ws/src/lateral_controller/msg/student.msg" NAME_WE)
add_dependencies(lateral_controller_generate_messages_eus _lateral_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/morive_ws/src/lateral_controller/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(lateral_controller_generate_messages_eus _lateral_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lateral_controller_geneus)
add_dependencies(lateral_controller_geneus lateral_controller_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lateral_controller_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(lateral_controller
  "/home/ubuntu/morive_ws/src/lateral_controller/msg/student.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lateral_controller
)

### Generating Services
_generate_srv_lisp(lateral_controller
  "/home/ubuntu/morive_ws/src/lateral_controller/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lateral_controller
)

### Generating Module File
_generate_module_lisp(lateral_controller
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lateral_controller
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(lateral_controller_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(lateral_controller_generate_messages lateral_controller_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/morive_ws/src/lateral_controller/msg/student.msg" NAME_WE)
add_dependencies(lateral_controller_generate_messages_lisp _lateral_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/morive_ws/src/lateral_controller/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(lateral_controller_generate_messages_lisp _lateral_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lateral_controller_genlisp)
add_dependencies(lateral_controller_genlisp lateral_controller_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lateral_controller_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(lateral_controller
  "/home/ubuntu/morive_ws/src/lateral_controller/msg/student.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lateral_controller
)

### Generating Services
_generate_srv_nodejs(lateral_controller
  "/home/ubuntu/morive_ws/src/lateral_controller/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lateral_controller
)

### Generating Module File
_generate_module_nodejs(lateral_controller
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lateral_controller
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(lateral_controller_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(lateral_controller_generate_messages lateral_controller_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/morive_ws/src/lateral_controller/msg/student.msg" NAME_WE)
add_dependencies(lateral_controller_generate_messages_nodejs _lateral_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/morive_ws/src/lateral_controller/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(lateral_controller_generate_messages_nodejs _lateral_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lateral_controller_gennodejs)
add_dependencies(lateral_controller_gennodejs lateral_controller_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lateral_controller_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(lateral_controller
  "/home/ubuntu/morive_ws/src/lateral_controller/msg/student.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lateral_controller
)

### Generating Services
_generate_srv_py(lateral_controller
  "/home/ubuntu/morive_ws/src/lateral_controller/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lateral_controller
)

### Generating Module File
_generate_module_py(lateral_controller
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lateral_controller
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(lateral_controller_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(lateral_controller_generate_messages lateral_controller_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/morive_ws/src/lateral_controller/msg/student.msg" NAME_WE)
add_dependencies(lateral_controller_generate_messages_py _lateral_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/morive_ws/src/lateral_controller/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(lateral_controller_generate_messages_py _lateral_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lateral_controller_genpy)
add_dependencies(lateral_controller_genpy lateral_controller_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lateral_controller_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lateral_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lateral_controller
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(lateral_controller_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lateral_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lateral_controller
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(lateral_controller_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lateral_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lateral_controller
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(lateral_controller_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lateral_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lateral_controller
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(lateral_controller_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lateral_controller)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lateral_controller\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lateral_controller
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(lateral_controller_generate_messages_py std_msgs_generate_messages_py)
endif()
