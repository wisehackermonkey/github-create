module Helper
    require 'io/console'
    # Hides users password to when typed into shell
    # Source
    def get_password
        password = STDIN.noecho(&:gets).chomp
    end
end