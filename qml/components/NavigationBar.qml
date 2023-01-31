import QtQuick 2.15
import "../widgets"

Rectangle {
    id: root
    height: 60
    width: parent.width
    color: "#444"
    anchors.top: parent.top

    Icon {
        icon: "\uf14a"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        size: 24
        color: "#eee"
    }

    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 45
        anchors.rightMargin: 20
        leftPadding: 10
        text: qsTr("To-Do App")
        font.bold: true
        color: "#eee"
        font.pixelSize: 18
    }
}
