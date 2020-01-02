# Package

version       = "0.1.0"
author        = "Mitsuru Kanenobu"
description   = "random Japanese name and address generator"
license       = "MIT"
srcDir        = "src"
skipDirs      = @["test", "data"]


# Dependencies

requires "nim >= 1.0.2"
requires "yaml >= 0.12.0"

# Tasks
task update_asset, "update asset file":
  try:
    exec "nim c -r update_asset.nim"
  finally:
    rmFile "update_asset"

task document, "update document":
  rmDir "htmldoc"
  mkDir "htmldoc"

  try:
    exec """
    for file in `find src | grep nim`; do
      nim doc --outdir:htmldocs $file
    done
    """
  except:
    rmDir "htmldoc"

task check_style, "check coding style":
  proc checkStyle(fileName: string) =
    exec("nim c --compileOnly:on --hints:off --styleCheck:error " & fileName)

  checkStyle("src/gimei.nim")

