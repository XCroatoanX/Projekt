add_library(projekt-qml)

ecm_add_qml_module(projekt-qml URI "org.kde.projekt.qml" GENERATE_PLUGIN_SOURCE)

ecm_target_qml_sources(
  projekt-qml
  SOURCES
  Main.qml
  AboutPage.qml
  AddBoardDialog.qml
  BoardCard.qml
  EditBoardDialog.qml
  KountdownDelegate.qml)

ecm_finalize_qml_module(projekt-qml)

install(TARGETS projekt-qml ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
