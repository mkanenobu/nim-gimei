let usePublished = existsEnv("TEST_MODE")

if usePublished:
  switch("NimblePath", "~/.nimble/bin")
else:
  switch("path", "$projectDir/../src")


switch("hints", "off")
