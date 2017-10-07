command! Reveal call functions#RevealInFinder()

command! -nargs=1 Duplicate execute "saveas" expand('%:p:h') . '/' . <q-args>

