require 'spec_helper'

describe "results/new" do
  before(:each) do
    assign(:result, stub_model(Result,
      :survey_id => 1,
      :answer_id => 1,
      :another_content => "MyText",
      :answer_email => "MyString"
    ).as_new_record)
  end

  it "renders new result form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", results_path, "post" do
      assert_select "input#result_survey_id[name=?]", "result[survey_id]"
      assert_select "input#result_answer_id[name=?]", "result[answer_id]"
      assert_select "textarea#result_another_content[name=?]", "result[another_content]"
      assert_select "input#result_answer_email[name=?]", "result[answer_email]"
    end
  end
end
