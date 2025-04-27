;extends
;all_sql
(raw_string_literal 
  (raw_string_literal_content) @injection.content
    (#vim-match? @injection.content "^.*\<html\>.*$")
    (#set! injection.language "html"))

