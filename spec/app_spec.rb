require File.expand_path '../spec_helper.rb', __FILE__

describe "anynines sinatra example" do
  it "should allow accessing the home page" do
    get '/'
    expect(last_response.status).to eq 200
  end

  it "should display hello world" do
    get '/'
    expect(last_response.body).to match("Hello world")
  end
end

describe "alyss section tests" do
  describe "accesses and shows text for sections 1-16" do
    index = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
    index.each do |i|
      it "accesses and shows text for section #{i}" do
        get "/section/#{i}"
        expect(last_response.status).to eq 200
        expect(last_response.body).to include("Section #{i}")
      end
    end
  end

  describe "gives error for non-existent sections" do
    index = [0, 17,20,40]
    index.each do |i|
      it "gives error for section #{i}" do
        get "/section/#{i}"
        expect(last_response.body).to match("This section does not exist!")
      end
    end
  end
end