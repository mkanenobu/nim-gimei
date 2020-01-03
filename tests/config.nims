# "normal", "nimble_test"
# when nimble_test, use global module
let mode = getEnv("TEST_MODE", "normal")

if mode == "normal":
  switch("path", "$projectDir/../src")

switch("hints", "off")
