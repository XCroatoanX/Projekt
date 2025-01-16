import QtQuick
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami

Kirigami.Dialog {
    id: addBoardDialog
    title: i18nc("@title:window", "Add board")
    standardButtons: Kirigami.Dialog.Ok | Kirigami.Dialog.Cancel
    padding: Kirigami.Units.largeSpacing
    preferredWidth: Kirigami.Units.gridUnit * 20

    Kirigami.FormLayout {
        Controls.TextField {
            id: nameField
            Kirigami.FormData.label: i18nc("@label:textbox", "Name*:")
            onAccepted: descriptionField.forceActiveFocus()
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
        button.enabled = Qt.binding( () => requiredFieldsFilled() );
    }

    onAccepted: {
        if (!requiredFieldsFilled()) return;
        appendDataToModel();
        clearFieldsAndClose();
    }

    function requiredFieldsFilled() {
        return (nameField.text !== "");
    }

    function appendDataToModel() {
        boardModel.append({
            title: nameField.text,
            description: descriptionField.text,
        });
    }

    function clearFieldsAndClose() {
        showPassiveNotification(nameField.text + " added")
        nameField.text = "";
        descriptionField.text = "";
        addBoardDialog.close();
    }
}
