import unittest
import strutils, random

import gimei

suite "gimei names":
  setup:
    # Randomize with same seed before tests
    randomize(1)

  test "gimeiFirstName":
    let firstName = gimeiFirstName()
    check firstName.kanji == "達弥"
    check firstName.hiragana == "たつや"
    check firstName.katakana == "タツヤ"

  test "gimeiLastName":
    let lastName = gimeiLastName()
    check lastName.kanji == "川口"
    check lastName.hiragana == "かわぐち"
    check lastName.katakana == "カワグチ"

  test "gimeiName":
    let gimeiName = gimeiName()
    check gimeiName.kanji == "川口 裕乃"
    check gimeiName.hiragana == "かわぐち ひろの"
    check gimeiName.katakana == "カワグチ ヒロノ"

    check gimeiName.firstName.kanji == "裕乃"
    check gimeiName.firstName.hiragana == "ひろの"
    check gimeiName.firstName.katakana == "ヒロノ"

    check gimeiName.lastName.kanji == "川口"
    check gimeiName.lastName.hiragana == "かわぐち"
    check gimeiName.lastName.katakana == "カワグチ"

  test "gimeiFirstName with gender":
    randomize(1)
    let maleFirstName = gimeiFirstName(Gender.Male)
    randomize(1)
    let femaleFirstName = gimeiFirstName(Gender.Female)
    check maleFirstName.kanji != femaleFirstName.kanji

  test "gimeiName with gender":
    randomize(1)
    let maleName = gimeiName(Gender.Male)
    randomize(1)
    let femaleName = gimeiName(Gender.Female)
    check maleName != femaleName

  test "gimeiName with splitter":
    let gimeiNameWithSplitter1 = gimeiName(sep = "TEST")
    check "TEST".in(gimeiNameWithSplitter1.kanji)

    let gimeiNameWithSplitter2 = gimeiName(sep = '*')
    check '*'.in(gimeiNameWithSplitter2.kanji)

  test "names `$`":
    let gimei = gimeiName()
    check gimei.kanji == $gimei
    let firstName = gimeiFirstName()
    check firstName.kanji == $firstName

  # Randomize
  test "Returns same value with same seed":
    randomize(1)
    let gimei1 = gimeiName().kanji
    randomize(1)
    let gimei2 = gimeiName().kanji
    check gimei1 == gimei2

  test "Returns different value with deferrent seed":
    randomize(1)
    let gimei1 = gimeiName().kanji
    randomize(2)
    let gimei2 = gimeiName().kanji
    check gimei1 != gimei2

  test "Returns deferrent value second time":
    let gimei1 = gimeiName().kanji
    let gimei2 = gimeiName().kanji
    check gimei1 != gimei2

