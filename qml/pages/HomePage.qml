import QtQuick 2.15
import QtQuick.Layouts 1.15

import "../delegates"
import "../components"

Item {
    id: root
    // anchors.fill: parent

    property var locale: Qt.locale()

    Component.onCompleted: {
        updateModel();
    }

    function updateModel() {
        for(var i=0; i<app.todoModel.length; i++) {
            _todoModel.append(app.todoModel[i])
            console.log(app.todoModel[i])
        }
    }

    Connections {
        target: app

        function onTodoModelChanged() {
            updateModel();
        }
    }

    ListModel {
        id: _todoModel
    }

    NavigationBar {
        id: navBar
    }


    ListView {
        id: todoList
        clip: true
        anchors.top: navBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: tabBar.bottom
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        model: _todoModel
        spacing: 5
        delegate: TodoDelegate {
            todoInfo: todo
            todoNotes: notes
            isDone: done
            todoIndex: index
            todoCreated: Date.fromLocaleString(locale, dateAdded, "yyyy-MM-ddThh:mm:ss")
            todoStart: Date.fromLocaleString(locale, dateDue.from, "yyyy-MM-ddThh:mm:ss")
            todoEnd: Date.fromLocaleString(locale, dateDue.to, "yyyy-MM-ddThh:mm:ss")

            onCheckToggled: app.todoModel[index].done = newState
        }
    }

    TabBar {
        id: tabBar
    }
}
