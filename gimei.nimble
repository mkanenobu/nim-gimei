# Package

version       = "0.1.0"
author        = "Mitsuru Kanenobu"
description   = "random Japanese name and address generator"
license       = "MIT"
srcDir        = "src"
skipDirs      = @["test", "data"]


# Dependencies

requires "nim >= 1.0.2"

# Tasks
task update_asset, "update asset file":
  requires "yaml >= 0.12.0"
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
  let suppressUnusedHints = "--hint[CC]:off --hint[Processing]:off --hint[Conf]:off"
  proc checkStyle(fileName: string) =
    try:
      exec("nim c --compileOnly:on " & suppressUnusedHints & " --styleCheck:error " & fileName)
    except:
      # Supress error message
      discard

  checkStyle("src/gimei.nim")
