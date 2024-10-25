# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "src/CMakeFiles/projekt_autogen.dir/AutogenUsed.txt"
  "src/CMakeFiles/projekt_autogen.dir/ParseCache.txt"
  "src/projekt_autogen"
  "src/qml/CMakeFiles/projekt-qml_autogen.dir/AutogenUsed.txt"
  "src/qml/CMakeFiles/projekt-qml_autogen.dir/ParseCache.txt"
  "src/qml/CMakeFiles/projekt-qmlplugin_autogen.dir/AutogenUsed.txt"
  "src/qml/CMakeFiles/projekt-qmlplugin_autogen.dir/ParseCache.txt"
  "src/qml/projekt-qml_autogen"
  "src/qml/projekt-qmlplugin_autogen"
  )
endif()
