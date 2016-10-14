require "rails_helper"

RSpec.describe "search/spaces/index.html.erb", type: :view do
  context "expected elements when init search" do
    before do
      assign :addresses, []
      render
    end
    it {expect(rendered).to match /Maps/}
    it {expect(rendered).to match /Find Space/}
    it {expect(rendered).to match /id="map"/}
  end
end
