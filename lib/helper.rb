# Helper functions for init.rb

# wisemonkey
# oranbusiness@gmail.com
# 20190206
# github.com/wisehackermonkey

module Helper
    require 'io/console'
    # Hides users password to when typed into shell
    # Source https://stackoverflow.com/questions/2338889/how-to-hide-password-input-from-terminal-in-ruby-script
    def get_password
        password = STDIN.noecho(&:gets).chomp
    end
end