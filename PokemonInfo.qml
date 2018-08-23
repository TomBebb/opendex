import QtQuick 2.4
import "colors.js" as Colors

PokemonInfoForm {
    function pad(num, size) {
        var s = num + "";
        while (s.length < size) s = "0" + s;
        return s;
    }
    function typeNameToColor(ty) {
        switch(ty.toLowerCase()) {
            case "normal": return Colors.NORMAL;
            case "fire": return Colors.FIRE;
            case "water": return Colors.WATER;
            case "electric": return Colors.ELECTRIC;
            case "grass": return Colors.GRASS;
            case "ice": return Colors.ICE;
            case "fighting": return Colors.FIGHTING;
            case "poison": return Colors.POISON;
            case "ground": return Colors.GROUND;
            case "flying": return Colors.FLYING;
            case "psychic": return Colors.PSYCHIC;
            case "bug": return Colors.BUG;
            case "rock": return Colors.ROCK;
            case "ghost": return Colors.GHOST;
            case "dragon": return Colors.DRAGON;
            case "dark": return Colors.DARK;
            case "steel": return Colors.STEEL;
            case "fairy": return Colors.FAIRY;
        }
    }

    function show(newNum) {
        db.readTransaction(
            function(tx) {
                var rs = tx.executeSql(
'SELECT pokemon.id, pokemon.weight, pokemon.height, pokemon_species_names.name, pokemon_species_names.genus
FROM pokemon \
INNER JOIN pokemon_species_names \
ON pokemon_species_names.pokemon_species_id = pokemon.id \
WHERE pokemon_species_names.local_language_id = 9 AND pokemon.id = ?', [newNum]);
                if(rs.rows.length === 0)
                    return;
                num = newNum;
                numLabel.text = "#" + pad(num, 3);
                var result = rs.rows.item(0);
                nameLabel.text = result.name;
                genusLabel.text = "The " + result.genus + " pokemon";

                var typeRs = tx.executeSql(
'SELECT pokemon_types.type_id, type_names.name \
FROM pokemon \
INNER JOIN pokemon_types \
ON pokemon_types.pokemon_id = pokemon.species_id \
INNER JOIN type_names \
ON type_names.type_id = pokemon_types.type_id \
WHERE type_names.local_language_id = 9 AND pokemon.id = ?', [newNum]);
                type1Background.visible = typeRs.rows.length > 0;
                type2Background.visible = typeRs.rows.length > 1;
                type1.text = typeRs.rows.item(0).name;
                if(type1 != undefined)
                    type1Background.color = typeNameToColor(type1.text);
                if(type2Background.visible) {
                    type2.text = typeRs.rows.item(1).name;
                    type2Background.color = typeNameToColor(type2.text);
                }
            }

        );
    }
    focus: true
    property int num: 0
    Keys.onPressed: {
        if(event.text.charAt(0) === "\b") {
            var numStr = num + "";
            show(numStr.substring(0, numStr.length - 1));
        } else if(event.key === Qt.Key_Right) {
            show(num + 1);
        } else if(event.key === Qt.Key_Left) {
            show(num - 1);
        } else if(parseInt(event.text) !== Number.NaN) {
            show((num + event.text) | 0);
        }
    }
}
