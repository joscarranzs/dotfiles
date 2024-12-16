return {
    -- Mason: Instalador de herramientas
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}

            -- Herramientas necesarias
            vim.list_extend(opts.ensure_installed, {
                "html-lsp", -- HTML
                "css-lsp", -- CSS
                "typescript-language-server", -- TypeScript y JavaScript
                "clangd", -- C y C++
                "astro-language-server", -- Astro
                "jdtls", -- Java
            })
        end,
    },

    -- Mason Tool Installer: Herramientas adicionales
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim", -- Corrección: Nombre completo del plugin
        opts = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "java-debug-adapter", -- Adaptador para depuración en Java
                    "java-test", -- Herramienta para pruebas en Java
                },
            })
        end,
    },

    -- Configuración de servidores LSP
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                -- Configuración para HTML
                html = {
                    settings = {
                        html = {
                            format = {
                                enable = true,
                                wrapLineLength = 120,
                                wrapAttributes = "force",
                            },
                            hover = {
                                documentation = true,
                                references = true,
                            },
                        },
                    },
                },

                -- Configuración para CSS
                cssls = {
                    settings = {
                        css = { validate = true },
                        less = { validate = true },
                        scss = { validate = true },
                    },
                },

                -- Configuración para TypeScript y JavaScript
                tsserver = {
                    settings = {
                        typescript = {
                            inlayHints = {
                                includeInlayParameterNameHints = "all",
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayVariableTypeHints = true,
                                includeInlayPropertyDeclarationTypeHints = true,
                            },
                        },
                        javascript = {
                            inlayHints = {
                                includeInlayParameterNameHints = "all",
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayVariableTypeHints = true,
                                includeInlayPropertyDeclarationTypeHints = true,
                            },
                        },
                    },
                    root_dir = function(...)
                        return require("lspconfig.util").root_pattern("package.json", "tsconfig.json", ".git")(...)
                    end,
                    single_file_support = false,
                },

                -- Configuración para Lua
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            diagnostics = { globals = { "vim" } },
                            workspace = { checkThirdParty = false },
                            telemetry = { enable = false },
                        },
                    },
                },
            },
            setup = function()
                local lspconfig = require("lspconfig")
                local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
                local lsp_attach = function(client, bufnr)
                    -- Aquí puedes agregar configuraciones adicionales al adjuntar el cliente LSP
                end

                -- Configurar Mason LSP
                require("mason-lspconfig").setup({
                    ensure_installed = {
                        "html", "cssls", "tsserver", "lua_ls", "clangd", "astro", "jdtls",
                    },
                })

                -- Configurar manejadores para los servidores
                require("mason-lspconfig").setup_handlers({
                    function(server_name)
                        lspconfig[server_name].setup({
                            on_attach = lsp_attach,
                            capabilities = lsp_capabilities,
                        })
                    end,
                })
            end,
        },
        config = function()
            -- Cambiar el estilo de los bordes de ventanas flotantes del LSP
            local open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or "rounded"
                return open_floating_preview(contents, syntax, opts, ...)
            end
        end,
    },
}
