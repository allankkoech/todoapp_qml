import QtQuick 2.15
import QtQuick.Layouts 1.15

import "../delegates"
import "../components"
import "../widgets"

Item {
    id: root
    // anchors.fill: parent

    property var locale: Qt.locale()

    Component.onCompleted: {
        // updateModel();
    }

    NavigationBar {
        id: navBar
    }

    Item {
        anchors.fill: parent
        visible: todoList.count === 0

        Column {
            width: parent.width * 0.8
            anchors.centerIn: parent
            spacing: 20

            Icon {
                icon: "\uf07c"
                size: 64
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                text: qsTr("Ooops! Too empty here, try adding some tasks ...")
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    ListView {
        id: todoList
        clip: true
        visible: todoList.count > 0
        anchors.top: navBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: tabBar.bottom
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        model: app.todolistModel
        spacing: 5
        delegate: TodoDelegate {
            todoInfo: todo
            isDone: done
            todoUid: uid
            todoCreated: Date.fromLocaleString(locale, dateAdded, "yyyy-MM-ddThh:mm:ss")
            todoStart: Date.fromLocaleString(locale, dateDue.from, "yyyy-MM-ddThh:mm:ss")
            todoEnd: Date.fromLocaleString(locale, dateDue.to, "yyyy-MM-ddThh:mm:ss")

            onCheckToggled: {
                // console.log(index, _done)
                updateTodoDone(todoUid, _done)
            }
        }
    }

    TabBar {
        id: tabBar
        visible: false
    }
}
