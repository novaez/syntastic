"============================================================================
"File:        jslint20120203.vim
"Description: Javascript syntax checker - using jslint20120203
"Maintainer:  Martin Grenfell <martin.grenfell at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"Tested with jslint20120203 0.1.4.
"============================================================================
if exists("g:loaded_syntastic_javascript_jslint20120203_checker")
    finish
endif

let g:loaded_syntastic_javascript_jslint20120203_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_javascript_jslint20120203_GetHighlightRegex(item)
    let term = matchstr(a:item['text'], '\mExpected .* and instead saw ''\zs.*\ze''')
    if term != ''
        let term = '\V' . escape(term, '\')
    endif
    return term
endfunction

function! SyntaxCheckers_javascript_jslint20120203_GetLocList() dict
    let makeprg = self.makeprgBuild({ 'args': '--edition=2012-02-03' })

    let errorformat =
        \ '%E %##%\d%\+ %m,'.
        \ '%-Z%.%#Line %l\, Pos %c,'.
        \ '%-G%.%#'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'defaults': {'bufnr': bufnr("")} })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'javascript',
    \ 'exec': 'jslint',
    \ 'name': 'jslint20120203'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
