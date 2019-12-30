import json, random, sequtils, strutils
import base, parse

type
  Gender* = enum
    Male,
    Female,
    Both
  Gimei* = ref object of RootObj
    Last*: Yomi
    First*: Yomi
    name*: Yomi

let
  firstNames = namesJson["first_name"]
  firstNamesMale: seq[JsonNode] = firstNames["male"].elems
  firstNamesFemale: seq[JsonNode] = firstNames["female"].elems
  firstNamesBoth = concat(firstNamesMale, firstNamesFemale)
  lastNames: seq[JsonNode] = namesJson["last_name"].elems

func getFullname(first, last: Yomi): Yomi =
  Yomi(
    Kanji: [first.Kanji, last.Kanji].join(" "),
    Hiragana: [first.Hiragana, last.Hiragana].join(" "),
    Katakana: [first.Katakana, last.Katakana].join(" "),
  )

proc getFirstName*(gender: Gender): Yomi =
  if gender == Male:
    firstNamesMale.sample.nodeToYomi
  elif gender == Female:
    firstNamesFemale.sample.nodeToYomi
  else:
    firstNamesBoth.sample.nodeToYomi

proc getLastName*(): Yomi = lastNames.sample.nodeToYomi

proc gimeiName*(gender: Gender): Gimei =
  ## Returns string, convert to Rune yourself if needed
  let
    lastName = getLastName()
    firstname = getFirstName(gender)
  Gimei(
    Last: lastName,
    First: firstName,
    name: getFullname(firstName, lastName),
  )

