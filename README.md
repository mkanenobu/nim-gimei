# nim-gimei

random Japanese name and address generator

[![CircleCI](https://circleci.com/gh/mkanenobu/nim-gimei.svg?style=svg)](https://circleci.com/gh/mkanenobu/nim-gimei)

## Installtion

```sh
nimble install gimei
```

## Types

#### Functions exclude `gimeiName, gimeiAddress, $` are return `Yomi` type

`Yomi` properties

- kanji
- hiragana
- katakana

### `gimeiName` returns `Gimei` type

`Gimei` properties

- kanji
- hiragana
- katakana
- firstName
  - kanji
  - hiragana
  - katakana
- LastName
  - kanji
  - hiragana
  - katakana

`gimeiName` and `gimeiFirstName` take `Gender` argument(`Gender.Male` or `Gender.Female`)

### `gimeiAddress` returns `Address` type

`Address` properties

- kanji
- hiragana
- katakana
- prefecture
  - kanji
  - hiragana
  - katakana
- city
  - kanji
  - hiragana
  - katakana
- town
  - kanji
  - hiragana
  - katakana

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

