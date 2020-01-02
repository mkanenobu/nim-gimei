import unittest
import random

import gimei

suite "gimei addresses":
  setup:
    # Randomize with same seed before tests
    randomize(1)

  test "gimeiPrefecture":
    let prefecture = gimeiPrefecture()
    check prefecture.Kanji == "大分県"
    check prefecture.Hiragana == "おおいたけん"
    check prefecture.Katakana == "オオイタケン"

  test "gimeiCity":
    let city = gimeiCity()
    check city.Kanji == "総社市"
    check city.Hiragana == "そうじゃし"
    check city.Katakana == "ソウジャシ"

  test "gimeiTown":
    let town = gimeiTown()
    check town.Kanji == "南神崎"
    check town.Hiragana == "みなみかんざき"
    check town.Katakana == "ミナミカンザキ"

  test "gimeiAddress":
    let address = gimeiAddress()
    check address.Kanji == "大分県島田市悪石島"
    check address.Hiragana == "おおいたけんしまだしあくせきじま"
    check address.Katakana == "オオイタケンシマダシアクセキジマ"

    check address.Prefecture.Kanji == "大分県"
    check address.City.Kanji == "島田市"
    check address.Town.Kanji == "悪石島"

  test "addresses `$`":
    let address = gimeiAddress()
    check address.Kanji == $address

  # Randomize
  test "Returns same value with same seed":
    randomize(1)
    let address1 = gimeiAddress().Kanji
    randomize(1)
    let address2 = gimeiAddress().Kanji
    check address1 == address2

  test "Returns different value with deferrent seed":
    randomize(1)
    let address1 = gimeiAddress().Kanji
    randomize(2)
    let address2 = gimeiAddress().Kanji
    check address1 != address2

  test "Returns deferrent value second time":
    let address1 = gimeiAddress().Kanji
    let address2 = gimeiAddress().Kanji
    check address1 != address2

