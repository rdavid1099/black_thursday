require 'csv'

module FileReader

  def generate_from_file(pathname, repo)
    contents = CSV.open pathname, headers: true, header_converters: :symbol
    contents.each do |content|
      repo.add_data(content)
    end
  end

end
