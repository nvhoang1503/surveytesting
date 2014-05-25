require 'spec_helper'

describe "surveys/new" do
  before(:each) do
    assign(:survey, stub_model(Survey,
      :question => "MyText",
      :user_id => 1,
      :answer_type_id => 1
    ).as_new_record)
  end

  it "renders new survey form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", surveys_path, "post" do
      assert_select "textarea#survey_question[name=?]", "survey[question]"
      assert_select "input#survey_user_id[name=?]", "survey[user_id]"
      assert_select "input#survey_answer_type_id[name=?]", "survey[answer_type_id]"
    end
  end
end
