#!/usr/bin/awk -f

BEGIN { need_tag = 1 ; have_attributions = 0 ; IGNORECASE = 1  }

{
    if ($0 ~ /^[[:space:]]*(Signed-off|Reviewed)-by:/) {
        have_attributions = 1
    } else {
        if (have_attributions) {
	    if (need_tag) {
		printf "%s\n", tag
		need_tag = 0
	    }
            have_attributions = 0
        }
    }
    print
}

END {
    if (have_attributions) {
	if (need_tag) {
	    printf "%s\n", tag
	    need_tag = 0
	}
    }
}
