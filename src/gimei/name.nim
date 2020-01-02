import json, random, sequtils, strutils
import asset
import base

type
  Gender* = enum
    Male,
    Female,
    Both
  Gimei* = ref object of Yomi
    LastName*: Yomi
    FirstName*: Yomi

let
  firstNames = namesJson["first_name"]
  firstNamesMale: seq[JsonNode] = firstNames["male"].elems
  firstNamesFemale: seq[JsonNode] = firstNames["female"].elems
  firstNamesBoth = concat(firstNamesMale, firstNamesFemale)
  lastNames: seq[JsonNode] = namesJson["last_name"].elems

func getFullname(first, last: Yomi, sep: string or char): Yomi =
  let separater: string = $sep
  Yomi(
    Kanji: [last.Kanji, first.Kanji].join(separater),
    Hiragana: [last.Hiragana, first.Hiragana].join(separater),
    Katakana: [last.Katakana, first.Katakana].join(separater),
  )

proc getFirstName*(gender: Gender): Yomi =
  if gender == Male:
    firstNamesMale.sample.nodeToYomi
  elif gender == Female:
    firstNamesFemale.sample.nodeToYomi
  else:
    firstNamesBoth.sample.nodeToYomi

proc getLastName*(): Yomi = lastNames.sample.nodeToYomi

proc gimeiName*(gender: Gender, sep: string or char): Gimei =
  ## Returns string, convert to Rune yourself if needed
  let
    lastName = getLastName()
    firstname = getFirstName(gender)
    fullName = getFullname(firstName, lastName, sep)

  Gimei(
    LastName: lastName,
    FirstName: firstName,
    Kanji: fullName.Kanji,
    Hiragana: fullName.Hiragana,
    Katakana: fullName.Katakana,
  )

