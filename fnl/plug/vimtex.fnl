(module plug.vimtex
  {require {nvim aniseed.nvim
            nu aniseed.nvim.util}})

;; "------------------------------------- vimtex   ---------------------------------
;; 
;; let g:vimtex_view_method = "skim"
;; let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
;; let g:vimtex_view_general_options = '-r @line @pdf @tex'
;; let g:vimtex_compiler_callback_hooks = ['UpdateSkim']
;; let g:vimtex_compiler_engine = 'xelatex'
;; 
;; let g:vimtex_compiler_latexmk = {
;;     \ 'executable' : 'latexmk',
;;     \ 'build_dir' : './build',
;;     \ 'options' : [
;;     \   '-xelatex',
;;     \   '-file-line-error',
;;     \   '-synctex=1',
;;     \   '-interaction=nonstopmode']}
;; 
;; function! UpdateSkim(status)
;;     if !a:status | return | endif
;; 
;;     let l:out = b:vimtex.out()
;;     let l:tex = expand('%:p')
;;     let l:cmd = [g:vimtex_view_general_viewer, '-r']
;;     if !empty(system('pgrep Skim'))
;;         call extend(l:cmd, ['-g'])
;;     endif
;;     call jobstart(l:cmd + [line('.'), l:out, l:tex])
;; endfunction
;; 
;; let g:tex_flavor = "latex"
;; let g:vimtex_quickfix_open_on_warning = 0
;; let g:vimtex_quickfix_mode = 2
;; let g:vimtex_compiler_progname = 'nvr'
