local config = {
    cmd = {'/home/novak/.local/share/nvim/mason/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    on_attach = On_attach

}

config.settings = {
    java = {
        project = {
            referencedLibraries = {
                -- '/home/novak/.install/javafx/javafx-sdk-22.0.1/lib/javafx.fxml.jar',
                -- '/home/novak/.install/javafx/javafx-sdk-22.0.1/lib/javafx.controls.jar'
                -- '/home/novak/.install/javafx/javafx-sdk-22.0.1/lib/*',
                -- '/home/novak/.install/javafx/javafx-sdk-22.0.1/src/*',
                -- '/home/novak/.install/javafx/javafx-sdk-22.0.1/src/**',
                -- '/home/novak/.install/javafx/javafx-sdk-22.0.1/src/***',
                -- '/home/novak/.install/javafx/javafx-sdk-22.0.1/src/****',
            },
        },


        -- eclipse = {
        --     downloadSources = true,
        -- },
        -- contentProvider = {
        --     preferred = 'fernflower'
        -- },
    }
}

require('jdtls').start_or_attach(config)
