import QtQuick 2.15

import "../widgets"

Item {
    id: root
    width: todoList.width
    height: todoRow.height + 20

    property string todoInfo
    property string todoNotes
    property bool isDone
    property date todoCreated
    property date todoStart
    property date todoEnd
    property int todoIndex

    signal checkToggled(bool newState)


    Rectangle {
        height: root.height
        width: parent.width * 0.9
        radius: 10
        color: '#eee'
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            width: 5
            height: parent.height
            color: "green"
            anchors.left: parent.left
        }

        Row {
            id: todoRow
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 20
            anchors.rightMargin: 15
            anchors.verticalCenter: parent.verticalCenter

            CheckBox {
                id: checkBox
                checked: isDone
                anchors.verticalCenter: parent.verticalCenter

                onToggled: checkToggled(!isDone)
            }

            Text {
                id: todoText
                text: todoInfo
                wrapMode: Text.WordWrap
                width: todoRow.width - checkBox.width
                anchors.verticalCenter: parent.verticalCenter
                leftPadding: 5
            }
        }
    }
}
