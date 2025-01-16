import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami
import org.kde.kirigamiaddons.formcard as FormCard
import org.kde.projekt 1.0

Kirigami.ApplicationWindow {
    id: root

    width: 800
    height: 600

    title: i18nc("@title:window", "Projekt")

    // Drawer for top bar functions (in top left)
    globalDrawer: Kirigami.GlobalDrawer {
        isMenu: true
        actions: [
            Kirigami.Action {
                text: i18n("Quit")
                icon.name: "application-exit-symbolic"
                shortcut: StandardKey.Quit
                onTriggered: Qt.quit()
            },
            Kirigami.Action {
                text: i18n("About Projekt")
                icon.name: "help-about"
                onTriggered: root.pageStack.layers.push(aboutPage)
            },
            Kirigami.Action {
                text: i18n("About KDE")
                icon.name: "kde"
                onTriggered: root.pageStack.layers.push(aboutKDE)
            }
        ]
    }

    // My About Page
    Component {
        id: aboutPage
        FormCard.AboutPage {}
    }
    Component {
        id: aboutKDE
        FormCard.AboutKDE {}
    }

    // Models, where our data will be stored
    ListModel {
        id: boardModel
        ListElement {
            title: "Card 1"
            description: "This is the first card."
        }
        ListElement {
            title: "Card 2"
            description: "This is the second card."
        }
    }

    // Import my dialogues for boards
    AddBoardDialog {
        id: addBoardDialog
    }

    EditBoardDialog {
        id: editBoardDialog
    }

    // Page initiation
    pageStack.initialPage: Kirigami.ScrollablePage {
        title: i18nc("@title", "Projekt")

        // Top Bar actions
        actions: [
            Kirigami.Action {
                id: addCard
                icon.name: "list-add-symbolic"
                text: i18nc("@action:button", "Add new board")
                onTriggered: addBoardDialog.open()
            }
        ]

        ColumnLayout {
            Kirigami.CardsLayout {
                id: cardsLayout

                Repeater {
                    model: boardModel
                    delegate: Kirigami.Card {
                        actions: [
                            Kirigami.Action {
                                text: qsTr("Edit")
                                icon.name: "edit-symbolic"
                                onTriggered: editBoardDialog.openForEdit(index)
                            },
                            Kirigami.Action {
                                text: qsTr("Remove")
                                icon.name: "delete-symbolic"
                                onTriggered: {
                                    showPassiveNotification(
                                        model.title + " removed")
                                    boardModel.remove(
                                        index) // Removes the card at the current index
                                }
                            }
                        ]
                        banner {
                            source: "qrc:/assets/banner.jpg"
                            title: model.title
                            titleAlignment: Qt.AlignLeft | Qt.AlignBottom
                        }
                        contentItem: Controls.Label {
                            wrapMode: Text.WordWrap
                            text: model.description
                        }
                    }
                }
            }
        }
    }
}
