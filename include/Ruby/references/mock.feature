Mock
-------------

For testing purpose, you may want to mock Algolia's API calls. We provide a [WebMock](https://github.com/bblimke/webmock) configuration that you can use including `algolia/webmock`:

```ruby
require 'algolia/webmock'

describe 'With a mocked client' do

  before(:each) do
    WebMock.enable!
  end

  it "shouldn't perform any API calls here" do
    index = Algolia::Index.new("friends")
    index.add_object!({ :name => "John Doe", :email => "john@doe.org" })
    index.search('').should == {} # mocked
    index.clear
    index.delete
  end

  after(:each) do
    WebMock.disable!
  end

end
```
