import QtQuick 2.4

Column {
    id: root
    width: 400
    height: 400
    spacing: 5
    property alias type2: type2
    property alias type2Background: type2Background
    property alias type1: type1
    property alias type1Background: type1Background
    property alias genusLabel: genusLabel
    property alias nameLabel: nameLabel
    property alias numLabel: numLabel
    y: 0

    Flow {
        id: header
        x: 0
        width: 400
        height: 30
        spacing: 20
        visible: true

        Text {
            id: numLabel
            x: 0
            width: 50
            height: 30
            text: qsTr("#000")
            font.pixelSize: 21
            font.bold: false
            font.weight: Font.DemiBold
            textFormat: Text.PlainText
            fontSizeMode: Text.HorizontalFit
            horizontalAlignment: Text.AlignLeft
        }

        Text {
            id: nameLabel
            text: qsTr("Missingno")
            fontSizeMode: Text.Fit
            font.pixelSize: 23
            font.weight: Font.ExtraBold
            textFormat: Text.PlainText
        }

        Flow {
            id: types
            x: 200
            y: 5
            spacing: 10
            Rectangle {
                id: type1Background
                x: 120
                width: 60
                height: 20
                color: "#ffffff"
                radius: 1
                Text {
                    id: type1
                    x: 0
                    text: qsTr("Text")
                    font.pixelSize: 12
                    verticalAlignment: Text.AlignVCenter
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                }
                border.width: 3
            }

            Rectangle {
                id: type2Background
                width: 60
                height: 20
                color: "#ffffff"
                radius: 1
                Text {
                    id: type2
                    width: 60
                    height: 20
                    text: qsTr("Text")
                    font.pixelSize: 12
                    verticalAlignment: Text.AlignVCenter
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                }
                border.width: 3
            }
        }
    }

    Text {
        id: genusLabel
        text: qsTr("The Mysterious Pokemon")
        font.pixelSize: 16
        style: Text.Raised
    }
}
