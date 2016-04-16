class Curser
  CATALAN_CURSINGS = [
    'joder la mare que em va parir',
    'collonnnnnnnns de deu sagrats',
  ]

  ENGLISH_CURSINGS = [
    'fuck',
    'fuck that shit',
    'fucking TRUMP',
    'oh geezus fuck',
  ]

  CATALAN_CURSINGS_FOR_TARGET = [
    'idiota',
    'mal pariduuuu',
  ]

  ENGLISH_CURSINGS_FOR_TARGET = [
    'dumbfucker',
    'basta4rd',
  ]

  ALL_CURSINGS = CATALAN_CURSINGS + ENGLISH_CURSINGS

  def random
    ALL_CURSINGS.sample
  end

  def english
    ENGLISH_CURSINGS.sample
  end

  def curse_to(target:, language:)
    if language == :catalan
      catalan_curse_to(target)
    else
      english_curse_to(target)
    end
  end

  private

  def catalan_curse_to(target)
    "En/la #{target} es un/a #{CATALAN_CURSINGS_FOR_TARGET.sample} i VISCA LA TERRA"
  end

  def english_curse_to(target)
    "#{target} is a/an #{ENGLISH_CURSINGS_FOR_TARGET.sample}"
  end
end
