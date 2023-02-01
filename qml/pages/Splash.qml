import QtQuick 2.15

Image {
    id: root
    source: "qrc:/assets/img/splash.jpg"
    fillMode: Image.PreserveAspectCrop

    Timer {
        running: true
        interval: 3500
        repeat: false
        onTriggered: {
            mainStack.push("qrc:/qml/pages/HomePage.qml")
        }
    }

    Rectangle {
        color: "black"
        opacity: 0.6
        anchors.fill: parent
    }
}
