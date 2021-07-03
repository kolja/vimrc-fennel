(module plug.vimtex
  {require {nvim aniseed.nvim
            a aniseed.core
            nu aniseed.nvim.util}})

(set nvim.g.tex_flavor :latex)
(set nvim.g.vimtex_view_method :skim)
(set nvim.g.vimtex_view_general_viewer "/Applications/Skim.app/Contents/SharedSupport/displayline")
(set nvim.g.vimtex_view_general_options "-r @line @pdf @tex")
(set nvim.g.vimtex_compiler_callback_hooks ["UpdateSkim"])
(set nvim.g.vimtex_compiler_engine :xelatex)
(set nvim.g.vimtex_quickfix_open_on_warning 0)
(set nvim.g.vimtex_quickfix_mode 2)
(set nvim.g.vimtex_compiler_progname :nvr)

(set nvim.g.vimtex_compiler_latexmk {
    :executable "latexmk"
    :build_dir "./build"
    :options ["-xelatex"
              "-file-line-error"
              "-synctex=1"
              "-interaction=nonstopmode"]})

(nu.fn-bridge :UpdateSkim :plug.vimtex :update-skim)

;;------- this is Work in progress -------
(defn update-skim [status]
    (if status 
      (let [out nvim.b.vimtex.out
            tex (nvim.fn.expand "%:p")
            cmd (a.str nvim.g.vimtex_view_general_viewer " -r")]
        (nvim.fn.jobstart (a.str cmd (nvim.fn.line ".") out tex)))))

