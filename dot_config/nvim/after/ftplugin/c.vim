compiler ninja
set makeprg=ninja\ -C\ build

let g:neomake_c_ninja_maker = {
    \ 'exe': 'ninja',
    \ 'args': ['-C', 'build'],
    \ 'append_file': 0,
    \ 'errorformat':
      \ '%*[^\"]\"%f\"%*\\D%l:%c:\ %m,'.
      \ '%*[^\"]\"%f\"%*\\D%l:\ %m,'.
      \ '%-G%f:%l:\ %trror:\ (Each\ undeclared\ identifier\ is\ reported\ only\ once,'.
      \ '%-G%f:%l:\ %trror:\ for\ each\ function\ it\ appears\ in.),'.
      \ '%f:%l:%c:\ %trror:\ %m,'.
      \ '%f:%l:%c:\ %tarning:\ %m,'.
      \ '%Dninja:\ Entering\ directory\ `%f'','.
      \ '%Dninja:\ Leaving\ directory\ `%f'','.
      \ '%-G%.%#'
    \ }


let g:neomake_c_enabled_makers = ['ninja']
" let g:neomake_open_list = 2
call neomake#configure#automake('w')
