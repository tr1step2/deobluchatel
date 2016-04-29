import QtQuick 2.0

Item {
    id: item

    property alias text: text.text
    property alias textSize: text.font.pointSize
    property alias textColor: text.color

    property color backgroundColor: "black"
    property color onMouseOverColor: "green"

    signal clicked()

    Rectangle {
        id: rect

        color: backgroundColor

        width: text.contentWidth + 10
        height: text.contentHeight + 10

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
            anchors.fill: parent
            hoverEnabled: true
            onClicked: item.clicked()
            onEntered: rect.color = onMouseOverColor
            onExited: rect.color = backgroundColor
        }
    }

}
