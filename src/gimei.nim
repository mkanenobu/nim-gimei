import gimei/base
import gimei/name
import gimei/address

# Name
proc gimeiFirstName*(gender: Gender = Both): Yomi = getFirstName(gender)
proc gimeiLastName*(): Yomi = getLastName()
proc gimeiName*(gender: Gender = Both, joinString: string = " "): name.Gimei =
  name.gimeiName(gender, joinString)

# Address
proc gimeiPrefecture*(): Yomi = getPrefecture()
proc gimeiTown*(): Yomi = getTown()
proc gimeiCity*(): Yomi = getCity()
proc gimeiAddress*(): address.Address = address.gimeiAddress()

