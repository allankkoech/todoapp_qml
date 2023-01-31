import QtQuick 2.15
import "../widgets"

Rectangle {
    id: root
    height: 60
    width: parent.width
    color: "#444"

    property string title: ""

    signal backClicked()

    Icon {
        icon: "\uf060"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        size: 24
        color: "#eee"

        MouseArea {
            anchors.fill: parent
            onClicked: mainStack.pop()
        }
    }

    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 45
        anchors.rightMargin: 20
        leftPadding: 10
        text: title
        font.bold: true
        color: "#eee"
        font.pixelSize: 18
    }
}
