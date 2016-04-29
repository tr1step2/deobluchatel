import QtQuick 2.0

Item {
    id: item

    property alias text: text.text
    property alias textSize: text.font.pointSize
    property alias textColor: text.color

    property color mouseOnColor: "green"
    property color backgroundColor: "red"

    signal clicked()

    Rectangle {
        id: rect

        width: 120 //text.contentWidth + 20
        height: 120 //width

        color: backgroundColor
        border.color: "black"
        border.width: 4
        radius: width * 0.5

        anchors.horizontalCenter: item.horizontalCenter
        anchors.verticalCenter: item.verticalCenter

        Text {
            id: text

            text: "_Text"
            font.bold: true

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        MouseArea {
            anchors.fill: rect
            hoverEnabled: true

            onClicked: item.clicked()
            onEntered: rect.color = mouseOnColor
            onExited: rect.color = backgroundColor
        }
    }
}
