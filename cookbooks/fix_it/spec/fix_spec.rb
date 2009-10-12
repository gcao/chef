require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'fix'

describe "fix" do
  test_file = File.expand_path(File.dirname(__FILE__) + '/test_file')
  test_file_backup = "#{test_file}.bak"
  
  after :each do
    `cp -f #{test_file_backup} #{test_file}`
  end
  
  it "should fix line" do
    line2_changed = "line2 --- changed"
    fix test_file, "TEST" do |line, line_no|
      if line_no == 2
        line2_changed
      end
    end
    File.open(test_file) do |f|
      f.readlines.should == ["line1\n", "#{line2_changed}\n", "line3"]
    end
  end

  it "should not change content if nothing is fixed" do
    fix test_file, "TEST" do |line, line_no|
    end
    File.open(test_file) do |f|
      f.readlines.should == ["line1\n", "line2\n", "line3"]
    end
  end
  
  it "should not fail if file does not exist" do
    fix File.expand_path(File.dirname(__FILE__) + '/this_does_not_exist'), "TEST" do
      'CHANGED'
    end
  end
end