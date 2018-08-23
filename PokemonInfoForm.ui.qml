import QtQuick 2.4

Column {
    id: root
    width: 400
    height: 400
    property alias type2: type2
    property alias type2Background: type2Background
    property alias type1Background: type1Background
    property alias type1: type1
    property alias genusLabel: genusLabel
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

    Flow {
        id: types
        width: 400
        height: 400
        spacing: 10

        Rectangle {
            id: type1Background
            width: 100
            height: 40
            color: "#ffffff"
            radius: 2
            border.width: 3
            Text {
                id: type1
                text: qsTr("Text")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
                font.pixelSize: 12
            }
        }

        Rectangle {
            id: type2Background
            width: 100
            height: 40
            color: "#ffffff"
            radius: 1
            border.width: 3
            Text {
                id: type2
                text: qsTr("Text")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
                font.pixelSize: 12
            }
        }
    }
}
