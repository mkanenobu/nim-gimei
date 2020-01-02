import json, random
import asset
import base

type
  Address* = ref object of Yomi
    Prefecture*: Yomi
    City*: Yomi
    Town*: Yomi

let
  prefectures: seq[JsonNode] = addressesJson["prefecture"].elems
  cities: seq[JsonNode] = addressesJson["city"].elems
  towns: seq[JsonNode] = addressesJson["town"].elems

proc concat(prefecture, town, city: Yomi): Yomi =
  Yomi(
    Kanji: prefecture.Kanji & city.Kanji & town.Kanji,
    Hiragana: prefecture.Hiragana & city.Hiragana & town.Hiragana,
    Katakana: prefecture.Katakana & city.Katakana & town.Katakana,
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
    Prefecture: prefecture,
    City: city,
    Town: town,
    Kanji: concated.Kanji,
    Hiragana: concated.Hiragana,
    Katakana: concated.Katakana,
  )

