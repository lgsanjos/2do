require_relative '../rb/todo_cli'
require_relative '../rb/create_category'

describe TodoCLI do

  let(:create_category) { double("CreateCategory") }

  it 'should parse new category command and call CreateCategory persist' do
    allow(CreateCategory).to receive(:new) { create_category } 

    create_category.stub(:persist)
    allow(create_category).to receive(:persist)

    TodoCLI.new('new cat-e-gory').execute!

    expect(CreateCategory).to have_received(:new).with('cat-e-gory')
    expect(create_category).to have_received(:persist)
  end
  
  it 'should parse and throw error when new category command miss category name' do
    allow(CreateCategory).to receive(:new)

    cli = TodoCLI.new('new')

    expect {
      output = cli.execute!
    }.to raise_error "Missing arguments!"

    expect(CreateCategory).not_to have_received(:new)
  end

end
