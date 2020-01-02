# nim-gimei
random Japanese name and address generator

## Installtion

```sh
nimble install gimei
```

## Types

#### Functions exclude `gimeiName, gimeiAddress, $` are return `Yomi` type

`Yomi` properties

- Kanji
- Hiragana
- Katakana

### `gimeiName` returns `Gimei` type

`Gimei` properties

- Kanji
- Hiragana
- Katakana
- FirstName
  - Kanji
  - Hiragana
  - Katakana
- LastName
  - Kanji
  - Hiragana
  - Katakana

`gimeiName` and `gimeiFirstName` take `Gender` argument(`Gender.Male` or `Gender.Female`)

### `gimeiAddress` returns `Address` type

`Address` properties

- Kanji
- Hiragana
- Katakana
- Prefecture
  - Kanji
  - Hiragana
  - Katakana
- City
  - Kanji
  - Hiragana
  - Katakana
- Town
  - Kanji
  - Hiragana
  - Katakana

`$` (stringify) returns Kanji string

## USAGE

See tests

## More Help

```sh
git clone https://github.com/mkanenobu/nim-gimei.git
cd nim-gimei
nimble document
## Open htmldocs/gimei.html with browser
```

