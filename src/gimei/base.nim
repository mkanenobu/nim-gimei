import json

type
  Yomi* = ref object of RootObj
    kanji*: string
    hiragana*: string
    katakana*: string

func nodeToYomi*(node: JsonNode): Yomi =
  let arr: seq[JsonNode] = node.elems
  Yomi(
    kanji: arr[0].getStr,
    hiragana: arr[1].getStr,
    katakana: arr[2].getStr
  )

