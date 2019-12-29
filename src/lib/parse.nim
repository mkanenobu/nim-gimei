import yaml, yaml/parser, yaml/tojson
import json

var
  addressesJson*: JsonNode
  namesJson*: JsonNode

block:
  let
    f: File = open("../data/addresses.yml", FileMode.fmRead)
    yaml: string = f.readAll
  defer: f.close
  addressesJson = loadToJson(yaml)[0]["addresses"]

block:
  let
    f: File = open("../data/names.yml", FileMode.fmRead)
    yaml: string = f.readAll
  defer: f.close
  namesJson = loadToJson(yaml)[0]

