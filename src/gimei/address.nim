import json, random
import asset
import base

type
  Address* = ref object of Yomi
    prefecture*: Yomi
    city*: Yomi
    town*: Yomi

let
  prefectures: seq[JsonNode] = addressesJson["prefecture"].elems
  cities: seq[JsonNode] = addressesJson["city"].elems
  towns: seq[JsonNode] = addressesJson["town"].elems

proc concat(prefecture, town, city: Yomi): Yomi =
  Yomi(
    kanji: prefecture.kanji & city.kanji & town.kanji,
    hiragana: prefecture.hiragana & city.hiragana & town.hiragana,
    katakana: prefecture.katakana & city.katakana & town.katakana,
  )

proc getPrefecture*(): Yomi = prefectures.sample.nodeToYomi
proc getTown*(): Yomi = towns.sample.nodeToYomi
proc getCity*(): Yomi = cities.sample.nodeToYomi

proc gimeiAddress*(): Address =
  let
    prefecture = getPrefecture()
    city = getCity()
    town = getTown()
    concated = concat(prefecture, town, city)

  Address(
    prefecture: prefecture,
    city: city,
    town: town,
    kanji: concated.kanji,
    hiragana: concated.hiragana,
    katakana: concated.katakana,
  )

