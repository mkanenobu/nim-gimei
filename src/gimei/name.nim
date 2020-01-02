import json, random, sequtils, strutils
import asset
import base

type
  Gender* = enum
    Male,
    Female,
    Both
  Gimei* = ref object of RootObj
    LastName*: Yomi
    FirstName*: Yomi
    # Same as `Yomi`
    Kanji*: string
    Hiragana*: string
    Katakana*: string

let
  firstNames = namesJson["first_name"]
  firstNamesMale: seq[JsonNode] = firstNames["male"].elems
  firstNamesFemale: seq[JsonNode] = firstNames["female"].elems
  firstNamesBoth = concat(firstNamesMale, firstNamesFemale)
  lastNames: seq[JsonNode] = namesJson["last_name"].elems

func getFullname(first, last: Yomi, joinString: string): Yomi =
  Yomi(
    Kanji: [first.Kanji, last.Kanji].join(joinString),
    Hiragana: [first.Hiragana, last.Hiragana].join(joinString),
    Katakana: [first.Katakana, last.Katakana].join(joinString),
  )

proc getFirstName*(gender: Gender): Yomi =
  if gender == Male:
    firstNamesMale.sample.nodeToYomi
  elif gender == Female:
    firstNamesFemale.sample.nodeToYomi
  else:
    firstNamesBoth.sample.nodeToYomi

proc getLastName*(): Yomi = lastNames.sample.nodeToYomi

proc gimeiName*(gender: Gender, joinString: string): Gimei =
  ## Returns string, convert to Rune yourself if needed
  let
    lastName = getLastName()
    firstname = getFirstName(gender)
    fullName = getFullname(firstName, lastName, joinString)

  Gimei(
    LastName: lastName,
    FirstName: firstName,
    Kanji: fullName.Kanji,
    Hiragana: fullName.Hiragana,
    Katakana: fullName.Katakana,
  )

