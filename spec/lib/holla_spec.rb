require 'spec_helper'
require 'stringio'

describe Holla do
  let(:output) { StringIO.new }
  let(:formatter) { Holla.new(@output) }
  let(:example) { RSpec::Core::ExampleGroup.describe.example }

  describe "start" do
    context "full messages" do
      it "should say something" do
        formatter.should_receive :say
        formatter.start 1
      end
    end

    context "summary only" do
      before { formatter.class.summary_only = true }
      after { formatter.class.summary_only = false }

      it "should not say anything" do
        formatter.should_not_receive :say
        formatter.start 1
      end
    end
  end

  describe "pass, pending, failed" do
    context "full messages" do
      context "example_passed" do
        it "should say something positive" do
          formatter.should_receive(:say) { |arg| Holla.messages[:positive].should include(arg) }
          formatter.example_passed example
        end
      end
      
      context "example_pending" do
        it "should say something indifferent" do
          formatter.should_receive(:say) { |arg| Holla.messages[:indifferent].should include(arg) }
          formatter.example_pending example
        end
      end

      context "example_failed" do
        it "should say something negative" do
          formatter.should_receive(:say) { |arg| Holla.messages[:negative].should include(arg) }
          formatter.example_failed example
        end
      end
    end

    context "summary only" do
      before { formatter.class.summary_only = true }
      after { formatter.class.summary_only = false }

      context "example_passed" do
        it "should not say anything" do
          formatter.should_not_receive :say
          formatter.example_passed example
        end
      end
      
      context "example_pending" do
        it "should not say anything" do
          formatter.should_not_receive :say
          formatter.example_pending example
        end
      end

      context "example_failed" do
        it "should not say anything" do
          formatter.should_not_receive :say
          formatter.example_failed example
        end
      end
    end
  end

  describe "dump_summary" do
    it "should speak the summary results" do
      formatter.should_receive(:say)
      formatter.dump_summary 5, 0, 0, 0
    end
  end
end
