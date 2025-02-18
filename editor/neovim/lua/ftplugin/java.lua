local jdtls_script = "/opt/homebrew/bin/jdtls"

if vim.uv.fs_stat(jdtls_script) then
    require("jdtls").start_or_attach {
        cmd = { jdtls_script }
    }
end

