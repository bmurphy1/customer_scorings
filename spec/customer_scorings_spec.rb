require_relative '../customer_scorings'

describe CustomerScorings do

  let(:attributes) { { income: 50000, zipcode: 60201, age: 35 } }
  let(:stub_url)   { "http://not-real.leapfrogonline.com/customer_scoring?income=50000&zipcode=60201&age=35" }

  describe "#get" do
    context "when request successful (status 200)" do
      it "returns json response" do
        body = { "propensity" => 0.26532, "ranking" => "C" }
        stub_request(:get, stub_url).
          to_return(status: 200, body: body)
        response = CustomerScorings.get(attributes)

        expect(response).to eq body
      end
    end

    context "when request unsuccessful (status 500)" do
      it "raises an error" do
        stub_request(:get, stub_url).
          to_return(status: 500, body: '')

        expect { CustomerScorings.get(attributes) }.to raise_error
      end
    end
  end
end