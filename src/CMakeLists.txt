add_executable(projekt
    assets.qrc)

ecm_add_qml_module(projekt
    URI
    org.kde.projekt
)

target_sources(projekt
    PRIVATE
    main.cpp
    # Add more source files here if needed
)

# ecm_target_qml_sources(projekt
#     SOURCES
#     # Add more QML files here if needed
# )

target_link_libraries(projekt
    PRIVATE
    Qt6::Quick
    Qt6::Qml
    Qt6::Gui
    Qt6::QuickControls2
    Qt6::Widgets
    KF6::I18n
    KF6::CoreAddons
    KF6::IconThemes
    projekt-qml
)

install(TARGETS projekt ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})


add_subdirectory(qml)
