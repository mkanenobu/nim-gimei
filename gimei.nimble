# Package

version       = "0.1.0"
author        = "Mitsuru Kanenobu"
description   = "random Japanese name and address generator"
license       = "MIT"
srcDir        = "src"
skipDirs = @["test"]


# Dependencies

requires "nim >= 1.0.2"
requires "yaml >= 0.12.0"

# Tasks
task update_asset, "update asset file":
  exec "nim c -r update_asset.nim"
  rmFile "update_asset"
