import lib/base
import lib/name

proc gimeiFirstName*(gender: Gender = Both): Yomi = getFirstName(gender)
proc gimeiLastName*(): Yomi = getLastName()
proc gimeiName*(gender: Gender = Both): Gimei = name.gimeiName(gender)


import lib/address

proc gimeiPrefecture*(): Yomi = getPrefecture()
proc gimeiTown*(): Yomi = getTown()
proc gimeiCity*(): Yomi = getCity()
proc gimeiAddress*(): Address = address.gimeiAddress()

