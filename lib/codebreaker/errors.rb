module Codebreaker
  # Базовый класс для всех ошибок игры
  class Error < StandardError; end

  # Конкретные ошибки-потомки
  class InvalidGuess < Error; end
  class GameNotStartedError < Error; end # пример еще одной ошибки на будущее
end