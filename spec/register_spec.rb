require_relative '../rb/register'

describe Register do

  it 'should initialize and allow properties to be read' do
    reg = Register.new('\$_ c6992d \$_ some_other_key \$_ my content')

    expect(reg.hash).to eq('c6992d')
    expect(reg.key).to eq('some_other_key')
    expect(reg.content).to eq('my content')
  end

  it 'should fail when hash doesnt mach the content' do
    expect {
      Register.new('\$_ c6992d \$_ some_other_key \$_ my other content')
    }.to raise_error(RuntimeError, /Invalid hash. \(c6992d\) does not match with \(b1cd81\)/ )
  end

  it 'should fail when wrong number of registers' do
    expect {
      Register.new('c6992d \$_ some_other_key \$_ my content')
    }.to raise_error(RuntimeError, /Invalid Register\(3\)/ )
  end

  it 'should compare based on its attributes' do
    reg = Register.new('\$_ c6992d \$_ some_other_key \$_ my content') 
    reg_to_cmp = Register.new('\$_ c6992d \$_ some_other_key \$_ my content') 

    expect(reg == reg_to_cmp).to be_truthy
  end

  it 'should fail when compared with a different register' do
    reg = Register.new('\$_ c6992d \$_ some_key \$_ my content') 
    reg_to_cmp = Register.new('\$_ c6992d \$_ some_other_key \$_ my content') 

    expect(reg == reg_to_cmp).to be_falsy
  end

  it 'should create a register given key and content' do
    reg = Register.create('some_other_key', 'my content')
    reg_from_string = Register.new('\$_ c6992d \$_ some_other_key \$_ my content')

    expect(reg == reg_from_string).to be_truthy
  end

end
