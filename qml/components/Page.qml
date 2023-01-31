import QtQuick 2.15

Rectangle {
    id: root

    property string title
    default property alias contentItem: content.children

    PageNavigationBar {
        id: navBar
        title: root.title
        anchors.top: parent.top
    }

    Item {
        id: content
        anchors.fill: parent
        anchors.topMargin: navBar.height
    }

}
