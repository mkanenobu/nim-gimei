import yaml, yaml/parser, yaml/tojson
import json, os

echo existsFile("data/names.yml")
echo existsFile("data/addresses.yml")
let
  addressesYaml: string = readFile("data/addresses.yml")
  addressesJson*: JsonNode = loadToJson(addressesYaml)[0]["addresses"]

  nameYaml: string = readFile("data/names.yml")
  namesJson*: JsonNode = loadToJson(nameYaml)[0]

