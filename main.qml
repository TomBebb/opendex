import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.LocalStorage 2.0
import QtQuick.Controls 1

Window {
    id: window
    property var db
    visible: true
    width: 720
    height: 480
    title: qsTr("Opendex")
    property int selectedPokemon: 1
    signal onPokemonChanged(int id)
    function updateSelectedPokemon(id) {
        selectedPokemon = id;
        console.log("Selected: "+id);
    }

    TabView {
        anchors.fill: parent
        Tab {
            title: "Overview"
            PokemonInfo {
                anchors.fill: parent
            }
        }
        Tab {
            title: "Stats"
            Rectangle { color: "blue" }
        }
        focus: true
        Keys.onPressed: {
            if(event.text.charAt(0) === "\b") {
                var numStr = selectedPokemon + "";
                var num = parseInt(selectedPokemon.substring(0, numStr.length - 1));
                onPokemonChanged(num);
            } else if(event.key === Qt.Key_Right) {
                onPokemonChanged(selectedPokemon+1);
            } else if(event.key === Qt.Key_Left) {
                onPokemonChanged(selectedPokemon--);
            } else if(parseInt(event.text) !== Number.NaN) {
                onPokemonChanged((selectedPokemon + event.text) | 0);
            }
        }
    }
    Component.onCompleted: {
        db = LocalStorage.openDatabaseSync('pokedex', "1.0" , "Pokedex", 1000000, "QSQLITE");
        onPokemonChanged.connect(updateSelectedPokemon);
    }
}
