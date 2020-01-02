import json, random
import asset
import base

type
  Address* = ref object of RootObj
    Prefecture*: Yomi
    Town*: Yomi
    City*: Yomi
    # Same as `Yomi`
    Kanji*: string
    Hiragana*: string
    Katakana*: string

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
    concated = concat(prefecture, town, city)

  Address(
    Prefecture: prefecture,
    Town: town,
    City: city,
    Kanji: concated.Kanji,
    Hiragana: concated.Hiragana,
    Katakana: concated.Katakana,
  )

