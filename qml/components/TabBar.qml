import QtQuick 2.15
import QtQuick.Layouts 1.15

import "../widgets"

Rectangle {
    id: root
    height: 60
    color: "#eee"
    width: parent.width
    anchors.bottom: parent.bottom

    Rectangle {
        height: 2
        width: parent.width
        color: "grey"
        opacity: 0.5
        anchors.top: parent.top
    }

    RowLayout {
        spacing: 5
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Icon {
                icon: "\uf03a"
                anchors.centerIn: parent
                size: 28
                color: "#444"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: navigateTo("history")
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Rectangle {
                height: 70
                width: height
                radius: height/2
                color: "green"

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom

                Icon {
                    icon: "+"
                    anchors.centerIn: parent
                    size: 38
                    color: "#fff"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: navigateTo("new")
                }
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Icon {
                icon: "\uf013"
                anchors.centerIn: parent
                size: 28
                color: "#444"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: navigateTo("settings")
            }
        }
    }


}
