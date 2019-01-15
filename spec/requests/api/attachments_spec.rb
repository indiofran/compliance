require 'rails_helper'

describe Attachment do 
  it "attaches a few files" do
    issue = create(:basic_issue)
    seed = create(:full_natural_docket_seed,
      issue: issue, add_all_attachments: false)

    file_one, file_two = %i(gif png).map do |ext|
      api_create "/attachments",
        jsonapi_attachment('natural_docket_seeds', seed.id.to_s, ext)
      api_response.data
    end

    api_get "/attachments/#{file_one.id}"
    api_response.data.relationships.attached_to_seed.data.to_h.should == {
      type: 'natural_docket_seeds', id: seed.id.to_s
    }
  end

  it 'attaches a file with a large base64 encoded image' do
    issue = create(:basic_issue)
    seed = create(:full_natural_docket_seed,
      issue: issue, add_all_attachments: false)

    fixtures = RSpec.configuration.file_fixture_path
  
    file_one, file_two = %i(one two).map do |file|
      base64 = Pathname.new(File.join(fixtures, "base64_#{file}_image.txt")).read
      api_create "/attachments",
        jsonapi_base64_attachment('natural_docket_seeds', seed.id.to_s, base64, :jpeg)
      api_response.data
    end
  end

  describe "when re-arranging attachments" do
    it "can be re-attached to a fruit" do
      pending
      fail
    end

    it "cannot be re-attached to a fruit from a different person" do
      pending
      fail
    end

    it "can be re-attached to a seed" do
      pending
      fail
    end

    it "cannot be re-attached to a seed from a different person" do
      pending
      fail
    end
  end
end
