import QtQuick 2.15
import "../widgets"

Rectangle {
    id: root
    height: 60
    width: parent.width
    color: themeColor
    anchors.top: parent.top

    Icon {
        icon: "\uf0ae"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        size: 24
        color: "#eee"
    }

    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: addButton.left
        anchors.leftMargin: 45
        anchors.rightMargin: 20
        leftPadding: 10
        text: qsTr("To-Do App")
        font.bold: true
        color: "#eee"
        font.pixelSize: 18
    }

    Rectangle {
        id: addButton
        color: ma.down ? Qt.lighter("orange") : "transparent"
        height: parent.height
        width: height
        anchors.right: parent.right
        anchors.rightMargin: 10

        Icon {
            icon: "\uf067"
            anchors.centerIn: parent
            size: 24
            color: "#eee"
        }

        MouseArea {
            id: ma
            anchors.fill: parent
            onClicked: {
                mainStack.push("qrc:/qml/pages/AddTodoPage.qml")
            }
        }
    }
}
