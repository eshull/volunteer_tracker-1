require "spec_helper"

describe Volunteer do
  describe '#name' do
    it 'returns the name of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      expect(test_volunteer.name).to(eq('Jane'))
    end
  end

  describe '#project_id' do
    it 'returns the project_id of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      expect(test_volunteer.project_id).to(eq(1))
    end
  end

  describe '#==' do
    it 'checks for equality based on the name of a volunteer' do
      volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :id => 1})
      volunteer2 = Volunteer.new({:name => 'Jane', :project_id => 1, :id => 1})
      expect(volunteer1==(volunteer2)).to(eq(true))
    end
  end

  context '.all' do
    it 'is empty to start' do
      expect(Volunteer.all).to(eq( []))
    end

    it 'returns all volunteers' do
      volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => 'Joe', :project_id => 1, :id => nil})
      volunteer2.save
      expect(Volunteer.all).to(eq( [volunteer1, volunteer2]))
    end
  end

  describe '#save' do
    it 'adds a volunteer to the database' do
      volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      volunteer1.save
      expect(Volunteer.all).to(eq( [volunteer1]))
    end
  end

  describe '.find' do
    it 'returns a volunteer by id' do
      volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      volunteer1.save

      volunteer2 = Volunteer.new({:name => 'Joe', :project_id => 1, :id => nil})
      volunteer2.save

      project1 = Project.new({:title => 'Teaching Kids to Code', :id => 1})
      project1.save
      expect(volunteer2.search_project(1)).to(eq( [volunteer1, volunteer2]))
    end
  end

  describe 'update_project_id ' do
    it 'assigns volunteers to a specific project' do
      project = Project.new({:title => 'Teaching Kids to Code', :id => 2})
      volunteer1 = Volunteer.new({:name => 'Jasmine'})
      volunteer1.update_project_id(2)
      volunteer1.save
      expect(project.id).to(eq(volunteer1.project_id))
    end
  end

end
