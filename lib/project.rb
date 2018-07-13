class Project
  attr_reader :id
  attr_accessor :title

  def initialize (parameters)
    @title = parameters.fetch(:title, "UNDEFINED TITLE")
    @id = parameters.fetch(:id, nil)
  end

  def ===
    self
  end

  def self.all
    all_projects = DB.exec("SELECT * FROM project;")
    projects = []
    all_projects.each() do |project|
      title = project.fetch("title")
      id = project.fetch("id").to_i()
      projects.push(Project.new({:title => title, :id => id, }))
    end
    projects
  end

  def save
  result = DB.exec("INSERT INTO project title VALUES '#{@title}' RETURNING id;")
  @id = result.first().fetch("id").to_i()
  end

  def find
    self
  end

  def volunteers
    self
  end

  def update
    self
  end

  def delete
    self
  end


end
