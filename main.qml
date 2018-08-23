import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.LocalStorage 2.0

Window {
    property var db
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    PokemonInfo {
    }
    Component.onCompleted: db = LocalStorage.openDatabaseSync('pokedex', "1.0" , "Pokedex", 1000000, "QSQLITE")
}
