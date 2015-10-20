require_relative '../rb/create_category'

describe CreateCategory do

  it 'should create an immutable category object with a frozen name' do
    category1 = CreateCategory.new("Today")
    category2 = CreateCategory.new("Today")

    category1.should_not eql category2

    category1.name.should eql 'Today'
    category1.to_s.should eql category2.to_s
  end

  it 'should persist the categories' do
    fake_repo = double('repository')
    fake_repo.should_receive('persist').with('category', 'next-week')

    cat = CreateCategory.new('next-week')
    cat.persist(fake_repo)
  end

end
