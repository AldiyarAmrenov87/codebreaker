# Добавляем папку lib в пути поиска Ruby
$LOAD_PATH.unshift(File.expand_path('../../lib', __dir__))

# Подключаем головной файл библиотеки проекта
require 'codebreaker'

# Здесь также можно настроить тестовые двойники или зависимости, если нужно
require 'rspec/expectations' # Если используется RSpec для проверок