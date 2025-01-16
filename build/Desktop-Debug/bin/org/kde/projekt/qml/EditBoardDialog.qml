import QtQuick
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami

Kirigami.Dialog {
    id: editBoardDialog
    property int index: -1 // Store the index of the card being edited
    title: i18nc("@title:window", "Edit board")
    standardButtons: Kirigami.Dialog.Ok | Kirigami.Dialog.Cancel
    padding: Kirigami.Units.largeSpacing
    preferredWidth: Kirigami.Units.gridUnit * 20

    Kirigami.FormLayout {
        Controls.TextField {
            id: nameField
            Kirigami.FormData.label: i18nc("@label:textbox", "Name*:")
        }
        Controls.TextField {
            id: descriptionField
            Kirigami.FormData.label: i18nc("@label:textbox", "Description:")
        }
        Controls.Label {
            text: "* = required fields"
        }
    }

    Component.onCompleted: {
        const button = standardButton(Kirigami.Dialog.Ok);
        button.enabled = Qt.binding(() => nameField.text !== ""); // Enable the OK button only if Name is filled
    }

    onAccepted: {
        if (index >= 0 && index < boardModel.count) {
            boardModel.set(index, {
                title: nameField.text,
                description: descriptionField.text
            });
        }
        showPassiveNotification("Updated to: " + nameField.text)
        editBoardDialog.close();
    }

    function openForEdit(editIndex) {
        index = editIndex;
        if (index >= 0 && index < boardModel.count) {
            nameField.text = boardModel.get(index).title;
            descriptionField.text = boardModel.get(index).description;
        }
        open();
    }
}
