" Options {{{

let b:endwise_addition = '{% end& %}'
let b:endwise_words = 'block,if,while,for'
let b:endwise_syngroups = 'jinjaStatement'
"
" }}}

let g:HtmlJinjaBodyElements = [
    \ ['block', 'endblock'],
    \ ['call', 'endcall'],
    \ ['filter', 'endfilter'],
    \ ['for', 'endfor'],
    \ ['if', 'elif', 'else', 'endif'],
    \ ['macro', 'endmacro'],
  \ ]
" excluding 'else' on for until matchit.vim can support a duplicate word
" (doesn't break the matching of 'else' for 'if' statements.
"    \ ['for', 'else', 'endfor'],

" add matchit.vim support for jinja tags
if exists("loaded_matchit")
    for element in g:HtmlJinjaBodyElements
        let pattern = ''
        for tag in element[:-2]
            if pattern != ''
                let pattern .= ':'
            endif
            let pattern .= '{%-\?\s*\<' . tag . '\>' "\_.\{-}-\?%}'
        endfor
        let pattern .= ':{%-\?\s*\<' . element[-1:][0] . '\>\s*-\?%}'
        let b:match_words .= ',' . pattern
    endfor
endif
" vim:ft=vim
