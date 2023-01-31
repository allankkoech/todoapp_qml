import QtQuick.Controls 2.15

Label {
    id: control
    text: icon
    color: "#444"
    font.pixelSize: size
    font.family: app.fontAwesomeFontLoader.name

    property string icon: ""
    property int size: 16
}
