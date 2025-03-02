database_file_path = ARGV[0]
command = ARGV[1]

if command == ".dbinfo"
  File.open(database_file_path, "rb") do |database_file|
    # You can use print statements as follows for debugging, they'll be visible when running tests.
    puts "Logs from your program will appear here"

    # Read page size
    database_file.seek(16) # Skip the first 16 bytes of the header
    page_size = database_file.read(2).unpack("n")[0]
    puts "database page size: #{page_size}"

    # MOve to the sqlite_schema page (page 1 starts at offset 100)
    database_file.seek(100 + 3) # 100 is the offset; 3 is where the cell count starts
    num_tables = database_file.read(2).unpack("n")[0] # Read 2 bytes

    puts "number of tables: #{num_tables}"

  end
end

# https://app.codecrafters.io/courses/sqlite/stages/2?repo=157b89f6-e6e3-4e4a-a89a-2e8e4e4884c7
# git push origin main to push to codecrafters
# git push github master