import unittest
import random

import gimei

suite "gimei addresses":
  setup:
    # Randomize with same seed before tests
    randomize(1)

  test "gimeiPrefecture":
    let prefecture = gimeiPrefecture()
    check prefecture.kanji == "大分県"
    check prefecture.hiragana == "おおいたけん"
    check prefecture.katakana == "オオイタケン"

  test "gimeiCity":
    let city = gimeiCity()
    check city.kanji == "総社市"
    check city.hiragana == "そうじゃし"
    check city.katakana == "ソウジャシ"

  test "gimeiTown":
    let town = gimeiTown()
    check town.kanji == "南神崎"
    check town.hiragana == "みなみかんざき"
    check town.katakana == "ミナミカンザキ"

  test "gimeiAddress":
    let address = gimeiAddress()
    check address.kanji == "大分県島田市悪石島"
    check address.hiragana == "おおいたけんしまだしあくせきじま"
    check address.katakana == "オオイタケンシマダシアクセキジマ"

    check address.prefecture.kanji == "大分県"
    check address.city.kanji == "島田市"
    check address.town.kanji == "悪石島"

  test "addresses `$`":
    let address = gimeiAddress()
    check address.kanji == $address
    let prefecture = gimeiPrefecture()
    check prefecture.kanji == $prefecture

  # Randomize
  test "Returns same value with same seed":
    randomize(1)
    let address1 = gimeiAddress().kanji
    randomize(1)
    let address2 = gimeiAddress().kanji
    check address1 == address2

  test "Returns different value with deferrent seed":
    randomize(1)
    let address1 = gimeiAddress().kanji
    randomize(2)
    let address2 = gimeiAddress().kanji
    check address1 != address2

  test "Returns deferrent value second time":
    let address1 = gimeiAddress().kanji
    let address2 = gimeiAddress().kanji
    check address1 != address2

