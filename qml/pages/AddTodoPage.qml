import QtQuick 2.15
import "../components"
import QtQuick.Controls 2.15 as QQC2
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.3


Page {
    id: root
    title: qsTr("Add Task")

    property string _todoInfo: ""

    function addNotes() {
        _todoInfo = todoItem.text

        if(_todoInfo.trim() == "") {
            //            messageDialog.text = "TODO task information cannot be blank!";
            //            messageDialog.visible = true;
            console.log("TODO task information cannot be blank!")
            return;
        }

        // Add the new todo item to screen
        if (addTodo(_todoInfo))
            app.mainStack.pop() // Exit the add TODO modal
    }

    //    MessageDialog {
    //        id: messageDialog
    //        title: "Oops!"
    //        standardButtons: StandardButton.Ok
    //    }

    contentItem: Item {
        anchors.fill: parent

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 10

            Text {
                text: qsTr("Task description")
                font.pixelSize: 12
                color: "#333"
            }

            QQC2.TextArea {
                id: todoItem
                placeholderText: qsTr("Enter todo task info ...")
                placeholderTextColor: "grey"
                background: Rectangle {
                    border.color: "#ccc"
                    border.width: 1
                    radius: 5
                    color: "transparent"
                }

                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            QQC2.Button {
                text: qsTr("Add")
                Layout.fillWidth: true

                onClicked: addNotes()
            }
        }
    }
}
