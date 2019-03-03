require "github/create/version"
require 'io/console'
module Github
    module Create

    end
end

# Hides users password to when typed into shell
# Source https://stackoverflow.com/questions/2338889/how-to-hide-password-input-from-terminal-in-ruby-script
def hide_password
  password = STDIN.noecho(&:gets).chomp
end
