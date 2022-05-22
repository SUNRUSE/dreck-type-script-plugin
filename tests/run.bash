#!/usr/bin/env bats

@test "first run" {
  repository=$(pwd)
  temporaryDirectory=$(mktemp -d)
  expected=$temporaryDirectory/expected
  cp -r ./tests/first-run/expected/. $expected
  mkdir -p $expected/submodules/dreck
  cp -r ./submodules/dreck $expected/submodules
  mkdir -p $expected/submodules/plugins/type-script
  cp -r . $expected/submodules/plugins/type-script
  actual=$temporaryDirectory/actual
  cp -r ./tests/first-run/input/. $actual
  mkdir -p $actual/submodules/dreck
  cp -r ./submodules/dreck $actual/submodules
  mkdir -p $actual/submodules/plugins/type-script
  cp -r . $actual/submodules/plugins/type-script
  cd $actual

  make --file ./submodules/dreck/makefile

  rm -r $actual/submodules/plugins/type-script/node_modules $actual/submodules/plugins/type-script/npm-install-marker
  cd $repository
  diff --brief --recursive $actual $expected
  rm -rf $temporaryDirectory
}
