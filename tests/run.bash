#!/usr/bin/env bats

@test "first run" {
  repository=$(pwd)
  temporaryDirectory=$(mktemp -d)
  expected=$temporaryDirectory/expected
  cp -r ./tests/first-run/expected/. $expected
  mkdir -p $expected/plugins/dreck
  cp -r ./dreck $expected/plugins
  mkdir -p $expected/plugins/type-script
  cp -r . $expected/plugins/type-script
  actual=$temporaryDirectory/actual
  cp -r ./tests/first-run/input/. $actual
  mkdir -p $actual/plugins/dreck
  cp -r ./dreck $actual/plugins
  mkdir -p $actual/plugins/type-script
  cp -r . $actual/plugins/type-script
  cd $actual

  make --file ./plugins/dreck/makefile

  rm -r $actual/plugins/type-script/node_modules $actual/plugins/type-script/npm-install-marker $actual/plugins/type-script/tsconfig.json
  cd $repository
  diff --brief --recursive $actual $expected
  rm -rf $temporaryDirectory
}
