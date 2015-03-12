cat data-hold/html/*.html | pup 'table table tr json{}' | 
  jq  --raw-output '.[] .children | [ 
    .[0] .children[0] .href, 
    .[0] .children[0] .text, 
    .[1] .text ,
    .[2] .text,
    .[3] .text,
    .[4] .text,
    .[5] .text,
    .[6] .text,
    .[7] .text
  ] | @csv'> data-hold/csv
