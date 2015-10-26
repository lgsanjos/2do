require 'digest/sha1'

class Register

  attr_reader :key
  attr_reader :hash
  attr_reader :content
  attr_reader :raw_string

  DELIMITER = '\$_'.freeze

  def initialize(raw_string)
    @raw_string = remove_linebreak(raw_string).freeze
    
    line_splited = @raw_string.split(DELIMITER)

    raise "Invalid Register(#{line_splited.size}): \n" + raw_string  unless line_splited.size == 4

    @hash = line_splited[1].strip.freeze
    @key = line_splited[2].strip.freeze
    @content = line_splited[3].strip.freeze

    re_generate_hash = Register.generate_hash(@content)
    raise "Invalid hash. (#{@hash}) does not match with (#{re_generate_hash})." unless @hash.eql? re_generate_hash
  end
  
  def self.create(key, content)
    hash = generate_hash(content)
    self.new("#{DELIMITER} #{hash} #{DELIMITER} #{key} #{DELIMITER} #{content}")
  end

  def ==(register)
    return true if
      register.hash.eql?(self.hash) &&
      register.content.eql?(self.content) &&
      register.key.eql?(self.key)

    false
  end

  def to_s
    raw_string
  end

  private
  
  def self.timestamp
    Time.now.strftime("%d/%m/%Y %H:%M")
  end

  def self.generate_hash(key)
    sha = Digest::SHA1.hexdigest(key)

    hash = sha.split(//).first(3) + sha.split(//).last(3)
    hash.join("") 
  end

  def remove_linebreak(string)
    string.gsub("\n",'')
  end


end
