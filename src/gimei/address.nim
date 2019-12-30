import json, random
import base, parse

type
  Address* = ref object of RootObj
    address*: Yomi
    Prefecture*: Yomi
    Town*: Yomi
    City*: Yomi

let
  prefectures: seq[JsonNode] = addressesJson["prefecture"].elems
  towns: seq[JsonNode] = addressesJson["town"].elems
  cities: seq[JsonNode] = addressesJson["city"].elems

proc concat(prefecture, town, city: Yomi): Yomi =
  Yomi(
    Kanji: prefecture.Kanji & town.Kanji & city.Kanji,
    Hiragana: prefecture.Hiragana & town.Hiragana & city.Hiragana,
    Katakana: prefecture.Katakana & town.Katakana & city.Katakana,
  )

proc getPrefecture*(): Yomi = prefectures.sample.nodeToYomi
proc getTown*(): Yomi = towns.sample.nodeToYomi
proc getCity*(): Yomi = cities.sample.nodeToYomi

proc gimeiAddress*(): Address =
  let
    prefecture = getPrefecture()
    town = getTown()
    city = getCity()

  Address(
    address: concat(prefecture, town, city),
    Prefecture: prefecture,
    Town: town,
    City: city,
  )

