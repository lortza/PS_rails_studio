require 'spec_helper'

describe "A project" do
  it "has expired if the pledging ends on date is in the past" do
    project = Project.new(pledging_ends_on: 2.days.ago)

    expect(project.pledging_expired?).to eq(true)
  end

  it "has not expired if the pledging ends on date is in the future" do
    project = Project.new(pledging_ends_on: 2.days.from_now)

    expect(project.pledging_expired?).to eq(false)
  end

  it "requires a name" do
    project = Project.new(name: "")
    project.valid?
    expect(project.errors[:name].any?).to eq(true)
  end #requires a name

  it "requires a description" do
    project = Project.new(description: "")
    project.valid?
    expect(project.errors[:description].any?).to eq(true)
  end # requires a description

  it "accepts a description up to 500 characters" do
    project = Project.new(description: "X" * 501)
    project.valid?
    expect(project.errors[:description].any?).to eq(true)
  end # accepts a description up to 500 characters

  it "accepts a positive target pledge amount" do
    project = Project.new(target_pledge_amount: 1)
    project.valid?
    expect(project.errors[:target_pledge_amount].any?).to eq(false)
  end # accepts a positive target pledge amount

  it "rejects a $0 target pledge amount" do
    project = Project.new(target_pledge_amount: 0)
    project.valid?
    expect(project.errors[:target_pledge_amount].any?).to eq(true)
  end # rejects a $0 target pledge amount

  it "rejects a negative target pledge amount" do
    project = Project.new(target_pledge_amount: -1)
    project.valid?
    expect(project.errors[:target_pledge_amount].any?).to eq(true)
  end # rejects a negative target pledge amount

  it "accepts properly formatted website URLs" do
     sites = %w[http://example.com https://example]
      sites.each do |site|
        project = Project.new(website: site)
        project.valid?
        expect(project.errors[:website].any?).to eq(false)
      end #sites.each do
  end # accepts properly formatted website URLs

  it "rejects improperly formatted website URLs" do
    sites = %w[example.com http examplehttp]
    sites.each do |site|
      project = Project.new(website: site)
      project.valid?
      expect(project.errors[:website].any?).to eq(true)
    end #sites.each do
  end # rejects improperly formatted website URLs

  it "accepts properly formatted image file names" do
     file_names = %w[e.png project.png project.jpg project.gif MOVIE.GIF]
      file_names.each do |file_name|
        project = Project.new(image_file_name: file_name)
        project.valid?
        expect(project.errors[:image_file_name].any?).to eq(false)
    end #file_names each do
  end # accepts properly formatted image file names

  it "rejects improperly formatted image file names" do
    file_names = %w[project .jpg .png .gif project.pdf project.doc]
    file_names.each do |file_name|
      project = Project.new(image_file_name: file_name)
      project.valid?
      expect(project.errors[:image_file_name].any?).to eq(true)
    end #file_names.each do
  end #rejects improperly formatted image file names


end #describe

### Schema
# t.string   "name"
# t.text     "description"
# t.decimal  "target_pledge_amount"
# t.datetime "created_at"
# t.datetime "updated_at"
# t.string   "website"
# t.date     "pledging_ends_on"
# t.string   "team_members"
# t.string   "image_file_name"
