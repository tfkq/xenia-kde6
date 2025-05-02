import QtQuick 2.5

Rectangle {
    id: root
    color: "black"

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true;
        } else if (stage == 5) {
            introAnimation.target = ring;
            introAnimation.from = 1;
            introAnimation.to = 0;
            introAnimation.running = true;
        }
    }

    Item {
        id: content
        anchors.fill: parent

        Image {
            id: xenia
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: 40
            source: "images/xenia.png"
            fillMode: Image.PreserveAspectFit
            height: parent.height * 0.65
            width: implicitWidth * (height / implicitHeight)
        }

        Image {
            id: ring
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * 0.75 - height / 2
            source: "images/ring.svg"
            fillMode: Image.PreserveAspectFit
            height: parent.height * 0.05
            width: height
            RotationAnimator on rotation {
                id: rotationAnimator
                from: 0
                to: 360
                duration: 800
                loops: Animation.Infinite
            }
        }
    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
