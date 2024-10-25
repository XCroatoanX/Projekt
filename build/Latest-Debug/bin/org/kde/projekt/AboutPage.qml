import QtQuick
import QtQuick.Layouts

import org.kde.kirigami as Kirigami
import org.kde.kirigamiaddons.formcard as FormCard

Kirigami.Page {
    id: aboutPage
    title: "About"
    Column {
        anchors.centerIn: parent

        Text {
            text: "This application is built using Kirigami."
            font.pointSize: 20
            wrapMode: Text.Wrap
        }

        Text {
            text: "Version 1.0.0"
            font.pointSize: 16
        }

        // Button to go back to the Home page
        Kirigami.BackButton {
            text: "Back to Home"
            onClicked: {
                // Navigate back to the previous page
                pageStack.pop()
            }
        }
    }
}
