import QtQuick
import QtQuick.Layouts

import org.kde.kirigami as Kirigami
import org.kde.kirigamiaddons.formcard as FormCard

Kirigami.Page {
    id: aboutPage
    title: "About"

    Kirigami.BackButton {
        onClicked: pageStack.pop()
    }

    Column {
        anchors.fill: parent
        anchors.margins: 20

        Text {
            text: "This application is built using Kirigami."
            font.pointSize: 20
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            text: "Version 1.0.0"
            font.pointSize: 16
            horizontalAlignment: Text.AlignHCenter
        }
    }
}

