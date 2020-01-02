import yaml, yaml/parser, yaml/tojson
import json, os, strformat

const
  addressDataPath = joinPath("src", "gimei", "data", "addresses.yml")
  namesDataPath = joinPath("src", "gimei", "data", "names.yml")
  assetPath = joinPath("src", "gimei", "asset.nim")

let
  addressesYaml: string = addressDataPath.readFile
  addressesJson: JsonNode = loadToJson(addressesYaml)[0]["addresses"]

  nameYaml: string = namesDataPath.readFile
  namesJson: JsonNode = loadToJson(nameYaml)[0]

block:
  let asset = assetPath.open(fmWrite)
  defer: asset.close

  asset.write("import json\n")
  asset.write(&"let addressesJson*: JsonNode = parseJson(r\"\"\"{addressesJson}\"\"\")")
  asset.write("\n")
  asset.write(&"let namesJson*: JsonNode = parseJson(r\"\"\"{namesJson}\"\"\")")

