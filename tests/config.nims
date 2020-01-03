let usePublished = existsEnv("TEST_MODE")

if not usePublished:
  switch("path", "$projectDir/../src")

switch("hints", "off")
