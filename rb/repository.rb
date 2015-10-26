require_relative 'register'

class Repository

  attr_reader :path
  attr_reader :delimiter

  def initialize(path)
    @path = path
  end

  def persist(key, value)
    output = build_register(key, value)
    write(output)
    
    output.hash
  end

  def load_by_hash(hash)
    read.map { |each| each; Register.new(each) }
        .select { |r| r.hash =~ /#{hash}/}
        .first
  end
  
  def load_by_key(key)
    read.map { |each| each; Register.new(each) }
        .select { |r| r.key =~ /#{key}/}
  end

  private

  def build_register(key, value)
    Register.create(key, value)
  end

  def write(register)
    File.write(path, register.to_s + "\n", mode: 'a')
  end

  def read
    IO.readlines(path)
  end

end
