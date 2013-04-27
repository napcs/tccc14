require 'spec_helper'

describe "tasks/new" do
  before(:each) do
    assign(:task, stub_model(Task,
      :name => "MyString",
      :description => "MyText",
      :status => 1,
      :priority => 1,
      :difficulty => ""
    ).as_new_record)
  end

  it "renders new task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tasks_path, "post" do
      assert_select "input#task_name[name=?]", "task[name]"
      assert_select "textarea#task_description[name=?]", "task[description]"
      assert_select "input#task_status[name=?]", "task[status]"
      assert_select "input#task_priority[name=?]", "task[priority]"
      assert_select "input#task_difficulty[name=?]", "task[difficulty]"
    end
  end
end
