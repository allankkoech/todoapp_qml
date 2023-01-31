import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2

QQC2.CheckBox {
    id: control
    text: qsTr("")
    checked: true

    indicator: Rectangle {
        implicitWidth: 26
        implicitHeight: 26
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: 3
        border.color: control.down ? "#17a81a" : "#21be2b"

        Rectangle {
            width: 14
            height: 14
            x: 6
            y: 6
            radius: 2
            color: control.down ? "#17a81a" : "#21be2b"
            visible: control.checked
        }
    }
}

