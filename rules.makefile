./submodules/plugins/type-script/npm-install-marker: ./submodules/plugins/type-script/package.json ./submodules/plugins/type-script/package-lock.json
	npm ci --prefix ./submodules/plugins/type-script
	touch $@

DRECK_TYPE_SCRIPT_INPUTS = $(patsubst ./%, ./ephemeral/src/%, $(filter %.ts, ${DRECK_SRC_PATHS})) $(patsubst ./%, ./ephemeral/intermediate/%, ${DRECK_INTERMEDIATE_TYPE_SCRIPT_PATHS})

# Note that the ./ephemeral/src/**/*.ts files are not used here as TypeScript does not allow specification of both source files and a project file.
./ephemeral/intermediate/index.js: ${DRECK_TYPE_SCRIPT_INPUTS} ./submodules/plugins/type-script/npm-install-marker
	mkdir -p $(dir $@)
	cd ./submodules/plugins/type-script && npx tsc --project ../../../tsconfig.json
