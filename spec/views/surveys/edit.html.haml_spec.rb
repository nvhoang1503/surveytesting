require 'spec_helper'

describe "surveys/edit" do
  before(:each) do
    @survey = assign(:survey, stub_model(Survey,
      :question => "MyText",
      :user_id => 1,
      :answer_type_id => 1
    ))
  end

  it "renders the edit survey form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", survey_path(@survey), "post" do
      assert_select "textarea#survey_question[name=?]", "survey[question]"
      assert_select "input#survey_user_id[name=?]", "survey[user_id]"
      assert_select "input#survey_answer_type_id[name=?]", "survey[answer_type_id]"
    end
  end
end
