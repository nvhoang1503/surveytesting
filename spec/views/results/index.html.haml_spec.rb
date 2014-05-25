require 'spec_helper'

describe "results/index" do
  before(:each) do
    assign(:results, [
      stub_model(Result,
        :survey_id => 1,
        :answer_id => 2,
        :another_content => "MyText",
        :answer_email => "Answer Email"
      ),
      stub_model(Result,
        :survey_id => 1,
        :answer_id => 2,
        :another_content => "MyText",
        :answer_email => "Answer Email"
      )
    ])
  end

  it "renders a list of results" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Answer Email".to_s, :count => 2
  end
end
