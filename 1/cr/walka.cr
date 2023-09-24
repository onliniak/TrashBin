require "benchmark"

#
# Wzór nie musi być poprawny fizycznie. Ma jedynie umożliwić pół-automatyczne 
# obliczanie obrażeń i dodatkowych premii od pancerza. W tym celu używam 
# połączenia prawdopodobnego wzoru z gry Mount & Blade + obliczam ile 
# siły potrzebuję do uszkodzenia prostopadłościanu o  podanych wymiarach.
# Ta siła to premia do pancerza, od której odejmuje się obrażenia.
# O ile to możliwe korzystam z książek 
# metalurgo-archeologów, a jeśli to niemożliwe biorę 
# informacje metalurgiczne i mnożę nacisk razy tysiąc.
# Najprawdopodobniej mieszam tu jednostki i pojęcia fizyczne ale 
# na potrzeby gry jest to akceptowalne.
#
# Istnieje wiele prostszych systemów, które być może pojawią się w przyszłości.
# Tutaj sprawdzam czy w grach online mogę używać bardziej skomplikowanych wzorów 
# i jak wpłyną one na wydajność serwera. Na chwilę obecną wydaje się że wzór 
# wykonujący się w mniej niż 0.01 sekundy będzie idealny, a poniżej 0.3s w porządku. 
# Istnieje też możliwość uruchamiania wzorów do 10s w chmurze.
# 
# https://forums.taleworlds.com/index.php?threads/damaga-calculators-soak-up-reducers-any-help.137021/
#
# https://www.quora.com/What-formula-would-you-use-for-armor-penetration-in-the-middle-age
# https://books.google.pl/books?id=GpVbnsqAzxIC&pg=PR3&hl=pl&source=gbs_selected_pages&cad=2#v=onepage&q&f=false
# https://www.azom.com/properties.aspx?ArticleID=62
# https://www.azom.com/properties.aspx?ArticleID=63
#
#
class Fight
@potential_damage : Float64
@remaining_damage : Float64
@armor_random : Int32

    def initialize(
        @player : Hash(String, Int16), 
        @monster : Hash(String, Int16), 
        @player_weapon : Hash(String, Int16), 
        @monster_armor : Hash(String, Float64))

        @potential_damage = 0
        @remaining_damage = 0
        @armor_random = Random.new.rand(50..100)
    end
    def potentialDamage(holding_modifier : Float64)
        weapon_base_damage = @player_weapon["damage"]
        weapon_profiency = @player["weaponProfiency"]

        weapon_profiency_bonus = (weapon_profiency * 0.150) / 100
        strength_bonus = ((@player["strength"] - @player_weapon["strengthNeeded"]) /5)

        @potential_damage = holding_modifier * (weapon_base_damage * weapon_profiency_bonus + strength_bonus)
    end
    def armorSoak(attack_type : UInt8)
        case attack_type
        when 0
            soak_factor = @monster_armor["soakCut"]
        when 1
            soak_factor = @monster_armor["soakPierce"]
        when 2
            soak_factor = @monster_armor["soakBlunt"]
        end

        armor_value = @monster_armor["value"]

        soaked_damage = armor_value * soak_factor.not_nil!
        @remaining_damage = ((@armor_random/100) * (@potential_damage - soaked_damage))
    end
    def armorReduction(attack_type : UInt8)
        case attack_type
        when 0
            reduce_factor = @monster_armor["reductionCut"]
        when 1
            reduce_factor = @monster_armor["reductionPierce"]
        when 2
            reduce_factor = @monster_armor["reductionBlunt"]
        end

        finalDamage = @remaining_damage * ((1 - ((@armor_random/100) * @monster_armor["value"])/100) * reduce_factor.not_nil!)
        return finalDamage * 10
    end
end

player = Hash(String, Int16).new
player["minHP"] = 100
player["maxHP"] = 100
player["armor"] = 1
player["strength"] = 30
player["agilty"] = 1
player["distance"] = 1
player["weaponRange"] = 10
player["weaponProfiency"] = 200

monster = Hash(String, Int16).new
monster["minHP"] = 100
monster["maxHP"] = 100
monster["armor"] = 1
monster["strength"] = 1
monster["agilty"] = 1
monster["distance"] = 10
monster["weaponRange"] = 1

player_weapon = Hash(String, Int16).new
player_weapon["damage"] = 40
player_weapon["strengthNeeded"] = 14

monster_armor = Hash(String, Float64).new
monster_armor["value"] = 10
monster_armor["soakCut"] = 0.8
monster_armor["soakPierce"] = 0.65
monster_armor["soakBlunt"] = 0.5
monster_armor["reductionCut"] = 1
monster_armor["reductionPierce"] = 0.5
monster_armor["reductionBlunt"] = 0.75

f = Fight.new(player, monster, player_weapon, monster_armor)
f.potentialDamage(0.9)
f.armorSoak(1)
p f.armorReduction(1)