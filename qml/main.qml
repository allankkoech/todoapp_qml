import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import "pages"


Window {
    id: app
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property alias mainStack: mainStack
    property alias fontAwesomeFontLoader: fontAwesomeFontLoader
    property var todoModel: [
        {
            id: 1,
            dateAdded: "2023-01-01T23:45:00",
            dateDue: {
                from: "2023-01-03T00:45:00",
                to: "2023-01-03T23:59:00"
            },
            todo: "Go to school",
            notes: "",
            done: true
        },
        {
            id: 2,
            dateAdded: "2023-01-01T23:45:00",
            dateDue: {
                from: "2023-01-03T00:45:00",
                to: "2023-01-03T23:59:00"
            },
            todo: "Go to school",
            notes: "",
            done: false
        },
        {
            id: 3,
            dateAdded: "2023-01-01T23:45:00",
            dateDue: {
                from: "2023-01-03T00:45:00",
                to: "2023-01-03T23:59:00"
            },
            todo: "Go to school",
            notes: "",
            done: true
        },
        {
            id: 4,
            dateAdded: "2023-01-01T23:45:00",
            dateDue: {
                from: "2023-01-03T00:45:00",
                to: "2023-01-03T23:59:00"
            },
            todo: "Go to school",
            notes: "",
            done: true
        },
        {
            id: 5,
            dateAdded: "2023-01-01T23:45:00",
            dateDue: {
                from: "2023-01-03T00:45:00",
                to: "2023-01-03T23:59:00"
            },
            todo: "Go to school",
            notes: "",
            done: false
        },
        {
            id: 6,
            dateAdded: "2023-01-01T23:45:00",
            dateDue: {
                from: "2023-01-03T00:45:00",
                to: "2023-01-03T23:59:00"
            },
            todo: "Go to school",
            notes: "",
            done: false
        },
        {
            id: 7,
            dateAdded: "2023-01-01T23:45:00",
            dateDue: {
                from: "2023-01-03T00:45:00",
                to: "2023-01-03T23:59:00"
            },
            todo: "Go to school",
            notes: "",
            done: true
        },
        {
            id: 8,
            dateAdded: "2023-01-01T23:45:00",
            dateDue: {
                from: "2023-01-03T00:45:00",
                to: "2023-01-03T23:59:00"
            },
            todo: "Go to school",
            notes: "",
            done: false
        }
    ]

    function navigateTo(page) {
        if(page==="history") mainStack.push("qrc:/qml/pages/HistoryPage.qml")
        else if(page==="new") mainStack.push("qrc:/qml/pages/AddTodoPage.qml")
        else mainStack.push("qrc:/qml/pages/SettingsPage.qml")
    }

    onClosing: {
        if(mainStack.depth == 1) {
            close.accepted = true
            return;
        }

        // Pop page if back button clicked on android
        close.accepted = false
        mainStack.pop()
    }

    StackView {
        id: mainStack
        anchors.fill: parent

        initialItem: HomePage {}
    }

    FontLoader {
        id: fontAwesomeFontLoader
        source: "qrc:/assets/fonts/fontawesome.otf"
    }
}
