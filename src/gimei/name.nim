import json, random, sequtils, strutils
import asset
import base

type
  Gender* = enum
    Male,
    Female,
    Both
  Gimei* = ref object of Yomi
    lastName*: Yomi
    firstName*: Yomi

let
  firstNames = namesJson["first_name"]
  firstNamesMale: seq[JsonNode] = firstNames["male"].elems
  firstNamesFemale: seq[JsonNode] = firstNames["female"].elems
  firstNamesBoth = concat(firstNamesMale, firstNamesFemale)
  lastNames: seq[JsonNode] = namesJson["last_name"].elems

func getFullname(first, last: Yomi, sep: string or char): Yomi =
  let separater: string = $sep
  Yomi(
    kanji: [last.kanji, first.kanji].join(separater),
    hiragana: [last.hiragana, first.hiragana].join(separater),
    katakana: [last.katakana, first.katakana].join(separater),
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
  let
    lastName = getLastName()
    firstname = getFirstName(gender)
    fullName = getFullname(firstName, lastName, sep)

  Gimei(
    lastName: lastName,
    firstName: firstName,
    kanji: fullName.kanji,
    hiragana: fullName.hiragana,
    katakana: fullName.katakana,
  )

