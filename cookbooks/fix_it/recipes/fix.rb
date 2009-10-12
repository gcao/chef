def fix file, error
  skip_fix_disclaimer = "SKIPPED FIXING << #{error} >> BECAUSE"
  
  unless File.exists? file
    puts skip_fix_disclaimer
    puts "#{file} does not exist."
    return
  end
  
  backup_file = file + ".bak"
  `cp -f #{file} #{backup_file}`
  
  fixed = false
  File.open(file, "w") do |to_file|
    File.open(backup_file) do |from_file|
      from_file.readlines.each_with_index do |line, line_no|
        changed = yield line, line_no + 1
        if changed
          fixed = true
          to_file.print changed + "\n"
        else
          to_file.print line
        end
      end
    end
  end
  
  `cp -f #{backup_file} #{file}` unless fixed
end

