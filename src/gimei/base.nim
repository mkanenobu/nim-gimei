import json

type
  Yomi* = object of RootObj
    Kanji*: string
    Hiragana*: string
    Katakana*: string

func nodeToYomi*(node: JsonNode): Yomi =
  let arr: seq[JsonNode] = node.elems
  Yomi(
    Kanji: arr[0].getStr,
    Hiragana: arr[1].getStr,
    Katakana: arr[2].getStr
  )

