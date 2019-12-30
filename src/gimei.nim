import gimei/base
import gimei/name
import gimei/address

# Name
proc gimeiFirstName*(gender: Gender = Both): Yomi = getFirstName(gender)
proc gimeiLastName*(): Yomi = getLastName()
proc gimeiName*(gender: Gender = Both): Gimei = name.gimeiName(gender)

# Address
proc gimeiPrefecture*(): Yomi = getPrefecture()
proc gimeiTown*(): Yomi = getTown()
proc gimeiCity*(): Yomi = getCity()
proc gimeiAddress*(): Address = address.gimeiAddress()

