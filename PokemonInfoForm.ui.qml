import QtQuick 2.4

Column {
    id: root
    width: 400
    height: 400
    property alias genusLabel: genusLabel
    property alias type2: type2
    property alias type2Background: type2Background
    property alias type1Background: type1Background
    property alias type1: type1
    property alias nameLabel: nameLabel
    property alias numLabel: numLabel

    Flow {
        id: header
        width: 400
        height: 30
        visible: true

        Text {
            id: numLabel
            width: 23
            height: 22
            text: qsTr("#000")
            font.pixelSize: 21
            font.bold: false
            font.weight: Font.DemiBold
            textFormat: Text.PlainText
            fontSizeMode: Text.FixedSize
            horizontalAlignment: Text.AlignLeft
        }

        Text {
            id: nameLabel
            text: qsTr("Missingno")
            font.pixelSize: 23
            font.weight: Font.ExtraBold
            textFormat: Text.PlainText
        }
    }

    Text {
        id: genusLabel
        text: qsTr("The Mysterious Pokemon")
        font.pixelSize: 16
        style: Text.Raised
    }

    Row {
        id: types
        width: 200
        height: 30

        Rectangle {
            id: type1Background
            width: 200
            height: 200
            color: "#ffffff"

            Text {
                id: type1
                x: 88
                y: 92
                text: qsTr("Text")
                font.pixelSize: 12
            }
        }

        Rectangle {
            id: type2Background
            width: 200
            height: 200
            color: "#ffffff"
            Text {
                id: type2
                x: 88
                y: 92
                text: qsTr("Text")
                font.pixelSize: 12
            }
        }
    }
}
