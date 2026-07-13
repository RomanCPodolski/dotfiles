local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, silent = true }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "LSP: go to definition" }))
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "LSP: go to declaration" }))
  vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "LSP: references" }))
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "LSP: implementation" }))
  vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "LSP: hover" }))
  vim.keymap.set("n", "gI", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "LSP: signature help" }))
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "LSP: code action" }))
  vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "LSP: diagnostics" }))
  vim.keymap.set("n", "<leader>crn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "LSP: rename" }))
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Diagnostic prev" }))
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Diagnostic next" }))
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, vim.tbl_extend("force", opts, { desc = "Diagnostic loclist" }))
end

local servers = { "lua_ls", "pyright", "rust_analyzer", "yamlls", "dockerls", "bashls" }

for _, server in ipairs(servers) do
  local ok, _ = pcall(function()
    local config = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    if server == "lua_ls" then
      config.settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
        },
      }
    elseif server == "rust_analyzer" then
      config.settings = { ["rust-analyzer"] = { check = { command = "clippy" } } }
    elseif server == "yamlls" then
      local schemastore = require("schemastore")
      config.settings = {
        yaml = {
          schemaStore = { enable = true, url = "" },
          schemas = schemastore.schemas({ "kubernetes" }),
          hover = true,
          completion = true,
          validate = true,
        },
      }
    end

    lspconfig[server].setup(config)
  end)

  if not ok then
    vim.schedule(function()
      vim.notify("LSP: " .. server .. " setup failed (not installed yet?)", vim.log.levels.WARN)
    end)
  end
end

vim.diagnostic.config({
  virtual_text = { prefix = " " },
  signs = true,
  underline = true,
  severity_sort = true,
})