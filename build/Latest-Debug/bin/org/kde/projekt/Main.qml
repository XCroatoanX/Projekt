import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami

Kirigami.ApplicationWindow {
    id: root

    width: 1280
    height: 720

    title: i18nc("@title:window", "Projekt")

    pageStack.initialPage: Kirigami.Page {
        title: i18nc("@title", "Projekt")

        Component.onCompleted: {
                    pageStack.push(Qt.createQmlObject('import QtQuick; import org.kde.kirigami as Kirigami; AboutPage {}', pageStack))
                }
    }

    globalDrawer: Kirigami.GlobalDrawer {
        title: "Menu"
        actions: [
            Kirigami.Action {
                text: "Boards"
                icon.name: "view-pim-tasks"
                onTriggered: showPassiveNotification("Boards coming soon :)")
            },
            Kirigami.Action {
                        text: i18nc("@settings","Settings")
                        icon.name: "configure"
            },
            Kirigami.Action {
                text: i18nc("@about","About")
                icon.name: "About"
                onTriggered: pageStack.push(Qt.createQmlObject('import QtQuick; import org.kde.kirigami as Kirigami; AboutPage {}', pageStack))
            }
        ]
    }
}
