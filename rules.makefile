./plugins/type-script/npm-install-marker: ./plugins/type-script/package.json ./plugins/type-script/package-lock.json
	npm ci --prefix ./plugins/type-script
	touch $@

./plugins/type-script/tsconfig.json: $(DRECK_TYPE_SCRIPT_INPUT_TYPE_SCRIPT_PATHS)
	node ./plugins/type-script/generate-tsconfig.js $^

$(DRECK_TYPE_SCRIPT_OUTPUT_JAVASCRIPT_PATHS): ./plugins/type-script/tsconfig.json ./plugins/type-script/npm-install-marker
	mkdir -p $(dir $@)
	cd ./plugins/type-script && npx tsc --project ./tsconfig.json
