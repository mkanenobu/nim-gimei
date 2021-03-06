import gimei/base
import gimei/name
import gimei/address

type
  Gender* = ## \
    ## Gender.Male or Gender.Female
    name.Gender

method `$`*(yomi: Yomi): string {.base.} = yomi.kanji

# Name
proc gimeiFirstName*(gender: Gender = Both): Yomi = getFirstName(gender)
proc gimeiLastName*(): Yomi = getLastName()
proc gimeiName*(gender: Gender = Both, sep: string or char = ' '): name.Gimei =
  name.gimeiName(gender, sep)

method `$`*(gimei: Gimei): string = gimei.kanji

# Address
proc gimeiPrefecture*(): Yomi = getPrefecture()
proc gimeiCity*(): Yomi = getCity()
proc gimeiTown*(): Yomi = getTown()
proc gimeiAddress*(): Address = address.gimeiAddress()

method `$`*(address: Address): string = address.kanji
