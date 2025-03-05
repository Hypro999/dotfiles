local JDTLS_SCRIPT = "/opt/homebrew/bin/jdtls"

if vim.uv.fs_stat(JDTLS_SCRIPT) then
    require("jdtls").start_or_attach {
        cmd = { JDTLS_SCRIPT }
    }
end

