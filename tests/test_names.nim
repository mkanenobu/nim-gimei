import unittest
import strutils, random

import gimei

suite "gimei names":
  setup:
    # Randomize with same seed before tests
    randomize(1)

  test "gimeiFirstName":
    let firstName = gimeiFirstName()
    check firstName.Kanji == "達弥"
    check firstName.Hiragana == "たつや"
    check firstName.Katakana == "タツヤ"

  test "gimeiLastName":
    let lastName = gimeiLastName()
    check lastName.Kanji == "川口"
    check lastName.Hiragana == "かわぐち"
    check lastName.Katakana == "カワグチ"

  test "gimeiName":
    let gimeiName = gimeiName()
    check gimeiName.Kanji == "川口 裕乃"
    check gimeiName.Hiragana == "かわぐち ひろの"
    check gimeiName.Katakana == "カワグチ ヒロノ"

    check gimeiName.FirstName.Kanji == "裕乃"
    check gimeiName.FirstName.Hiragana == "ひろの"
    check gimeiName.FirstName.Katakana == "ヒロノ"

    check gimeiName.LastName.Kanji == "川口"
    check gimeiName.LastName.Hiragana == "かわぐち"
    check gimeiName.LastName.Katakana == "カワグチ"

  test "gimeiFirstName with gender":
    randomize(1)
    let maleFirstName = gimeiFirstName(Gender.Male)
    randomize(1)
    let femaleFirstName = gimeiFirstName(Gender.Female)
    check maleFirstName.Kanji != femaleFirstName.Kanji

  test "gimeiName with gender":
    randomize(1)
    let maleName = gimeiName(Gender.Male)
    randomize(1)
    let femaleName = gimeiName(Gender.Female)
    check maleName != femaleName

  test "gimeiName with splitter":
    let gimeiNameWithSplitter1 = gimeiName(sep = "TEST")
    check "TEST".in(gimeiNameWithSplitter1.Kanji)

    let gimeiNameWithSplitter2 = gimeiName(sep = '*')
    check '*'.in(gimeiNameWithSplitter2.Kanji)

  test "names `$`":
    let gimei = gimeiName()
    check gimei.Kanji == $gimei

  # Randomize
  test "Returns same value with same seed":
    randomize(1)
    let gimei1 = gimeiName().Kanji
    randomize(1)
    let gimei2 = gimeiName().Kanji
    check gimei1 == gimei2

  test "Returns different value with deferrent seed":
    randomize(1)
    let gimei1 = gimeiName().Kanji
    randomize(2)
    let gimei2 = gimeiName().Kanji
    check gimei1 != gimei2

  test "Returns deferrent value second time":
    let gimei1 = gimeiName().Kanji
    let gimei2 = gimeiName().Kanji
    check gimei1 != gimei2

