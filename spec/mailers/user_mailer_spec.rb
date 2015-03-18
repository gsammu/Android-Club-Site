require "spec_helper"

describe UserMailer do
  describe "task_reminder" do
    let(:mail) { UserMailer.task_reminder }

    it "renders the headers" do
      mail.subject.should eq("Task reminder")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
