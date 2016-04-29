import QtQuick 2.0
import QtQuick.Particles 2.0

Rectangle {

    id: mainRect

    width: 240
    height: 400
    color: "lightblue"

    property int radioSize: 20;

    function showMainScreen() {
        //TODO: implement animation of changing screen

        if (mainScreen.visible == false) {
            startScreen.visible = false
            mainScreen.visible = true

            doneButton.visible = false
            mainAnimation.start()
        }
    }

    function showStartScreen() {
        if (startScreen.visible == false) {
            mainScreen.visible = false
            startScreen.visible = true

            doneButton.visible = false
        }
    }

    Item {
        id: startScreen

        anchors.fill: parent

        RoundButton {
            id: startButton

            //Data
            text: "Start"
            textSize: 30
            textColor: "white"
            backgroundColor: "red"

            //Position
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -40

            onClicked: showMainScreen()
        }

        CButton {
            id: settingsButton

            //Data
            text: "Settings"
            textSize: 18
            textColor: "white"
            backgroundColor: "black"

            //Position
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 60
        }

        CButton {
            id: aboutButton

            //Data
            text: "About"
            textSize: 18
            textColor: "white"
            backgroundColor: "black"

            //Position
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 120
        }
    }

    Item {
        id: mainScreen

        anchors.fill: parent
        visible: false

        function showDoneButton() {
            doneButton.visible = true;
        }

        CButton {
            id: doneButton

            visible: false

            //Data
            text: "Done"
            textSize: 44
            textColor: "white"
            backgroundColor: "green"
            onMouseOverColor: "green"

            //Position
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 80

            onClicked: showStartScreen()
        }

        Rectangle {
            id: blackRect

            width: 120
            height: 120
            radius: width * 0.5
            opacity: 0.9

            color: "black"

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -40
        }

        Rectangle {
            id: redRect

            width: 110
            height: 110
            radius: width * 0.5

            color: "red"

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -40
        }

        SequentialAnimation {
            id: mainAnimation

            loops: 2
            running: false

            ParallelAnimation {
                NumberAnimation { target: blackRect; easing.type: Easing.OutInSine; property: "width"; to: 200; duration: 800 }
                NumberAnimation { target: blackRect; easing.type: Easing.OutInSine; property: "height"; to: 200; duration: 800 }
            }

            ParallelAnimation {
                NumberAnimation { target: redRect; easing.type: Easing.OutInSine; property: "width"; to: 190; duration: 800 }
                NumberAnimation { target: redRect; easing.type: Easing.OutInSine; property: "height"; to: 190; duration: 800 }
            }

            ParallelAnimation {
                NumberAnimation { target: redRect; easing.type: Easing.OutInSine; property: "width"; to: 110; duration: 800 }
                NumberAnimation { target: redRect; easing.type: Easing.OutInSine; property: "height"; to: 110; duration: 800 }
            }

            ParallelAnimation {
                NumberAnimation { target: blackRect; easing.type: Easing.OutInSine; property: "width"; to: 120; duration: 800 }
                NumberAnimation { target: blackRect; easing.type: Easing.OutInSine; property: "height"; to: 120; duration: 800 }
            }

            onStopped: mainScreen.showDoneButton()
        }

    }
}
