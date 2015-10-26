require_relative '../rb/repository'
require_relative '../rb/register'

describe Repository do
  
  before :each do
    @file_path = './tmp/test.2do'
    File.delete(@file_path) if File.exists? @file_path
  end

  it 'should return a unique hash everytime it persist a task' do
    repo = Repository.new(@file_path)
    hash = repo.persist('a_key', 'some value')

    expect(hash).to eq('dc0a28')
  end

  it 'should store and retrieve an information given a key' do
    repo = Repository.new(@file_path)
    repo.persist('a_key', 'some value')
    
    loaded_result = repo.load_by_key('a_key')

    expect(loaded_result).to eq([Register.create('a_key', 'some value')] )
  end

  it 'should load multiple lines given a key' do
    repo = Repository.new(@file_path)

    repo.persist('a_key', 'some value')
    repo.persist('a_key', 'some different')
    repo.persist('a_key', 'totally another value')
    
    loaded_result = repo.load_by_key('a_key')

    expect(loaded_result).to eq(
       [Register.create('a_key', 'some value'),
        Register.create('a_key', 'some different'),
        Register.create('a_key', 'totally another value')
      ])
  end

  it 'should load a value given a hash' do
    repo = Repository.new(@file_path)
    hash = repo.persist('some_other_key', 'my content')
    
    loaded = repo.load_by_hash hash

    expect(loaded).to eq(Register.create('some_other_key', 'my content'))
  end

end
