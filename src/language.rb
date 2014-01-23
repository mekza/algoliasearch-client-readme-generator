class Language
  attr_reader :name
  attr_reader :referenceLanguage
  attr_reader :outputDir

  def initialize(languageName, languageData)
    @name = languageName
    @referenceLanguage = languageData["referenceLanguage"]
    @outputDir = languageData["outputDir"]
  end

  def import(featureFile, languages = [], default = "")
    if languages.empty? || languages.include?(name)
      import_file(featureFile, referenceLanguage)
    else
      default
    end
  end

  def snippet(featureFile, languages = [], default = "")
    import("#{featureFile}.snippet", languages, default)
  end

  def puts(strings, default = "")
    strings[name] || default
  end

  def ruby?
    name == 'Ruby'
  end

  def php?
    name == 'PHP'
  end

  def python?
    name == 'Python'
  end

  def nodejs?
    name == 'Node.js'
  end

  def get_binding
    binding
  end

  private  
  def import_file(fileName, dir)
    fileName = File.join(dir, fileName)
    content = File.read(fileName)
    content = content.strip
  end

end 
