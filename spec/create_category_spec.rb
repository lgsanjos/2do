require_relative '../rb/create_category'

describe CreateCategory do

  it 'should create an immutable category object with a frozen name' do
    category1 = CreateCategory.new("Today")
    category2 = CreateCategory.new("Today")

    expect(category1).not_to eq category2

    expect(category1.name).to eq 'Today'
    expect(category1.to_s).to eq category2.to_s
  end

  it 'should persist the categories' do
    fake_repo = double('repository')
    allow(fake_repo).to receive('persist')

    cat = CreateCategory.new('next-week')
    cat.persist(fake_repo)
  end

end
