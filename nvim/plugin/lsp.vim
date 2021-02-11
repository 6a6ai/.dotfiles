set completeopt=menuone,noinsert,noselect
set shortmess+=c
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>sh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ho :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>a :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>sld :lua vim.lsp.diagnostics.show_line_diagnostics()<CR>
nnoremap <leader>gD  <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>gtd <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>rf <cmd>lua vim.lsp.buf.formatting()<CR>

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_matching_smart_case = 1

