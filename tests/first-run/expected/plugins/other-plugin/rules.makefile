./plugins/other-plugin/generated/dreck_type_script_output_javascript_paths.txt:
	mkdir -p $(dir $@)
	echo $(DRECK_TYPE_SCRIPT_OUTPUT_JAVASCRIPT_PATHS) > $@
