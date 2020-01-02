import gimei/base
import gimei/name
import gimei/address

type Gender* = name.Gender

# Name
proc gimeiFirstName*(gender: Gender = Both): Yomi = getFirstName(gender)
proc gimeiLastName*(): Yomi = getLastName()
proc gimeiName*(gender: Gender = Both, sep: string or char = ' '): name.Gimei =
  name.gimeiName(gender, sep)

# Address
proc gimeiPrefecture*(): Yomi = getPrefecture()
proc gimeiCity*(): Yomi = getCity()
proc gimeiTown*(): Yomi = getTown()
proc gimeiAddress*(): address.Address = address.gimeiAddress()

