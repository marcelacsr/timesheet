require 'selenium/webdriver'
require 'webdrivers/chromedriver'

# Driver: chrome headless, executa os testes sem abrir a janela do navegador
Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: ['headless', 'disable-gpu',
                            'window-size=1920,1080'], w3c: false }
  )
  Capybara::Selenium::Driver.new(app, browser: :chrome,
                                      desired_capabilities: capabilities)
end

# Driver: chrome full, abrindo a janela e exibindo o sistema funcionando
Capybara.register_driver :chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: ['window-size=1920,1080'], w3c: false }
  )
  Capybara::Selenium::Driver.new(app, browser: :chrome,
                                      desired_capabilities: capabilities)
end

# Trocar quando for necessario,
# Manter o headless_chrome antes de commitar
Capybara.javascript_driver = :headless_chrome
# Capybara.javascript_driver = :chrome
