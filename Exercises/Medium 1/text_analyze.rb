# file = File.open("sample.txt")
# new_file = []

# file.read.split("\n\n").map { |word| new_file << word }

# file.close

class TextAnalyzer
  def process
    file = File.open("sample.txt")
    yield(file)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.read.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.read.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.read.split(" ").count} words" }