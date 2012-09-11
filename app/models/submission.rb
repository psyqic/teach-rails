class Submission < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  has_many :thumbs
  has_many :comments

  has_many :likers,
  :class_name => "User",
  :through => :thumbs

  def bonus_score
    project.bonus_score(user.id)
  end

  def tmp_dir_name
    "/tmp/submission" + self.id.to_s
  end

  def tmp_file_path
    self.tmp_dir_name + "/" + self.file_name
  end

  def tmp_port
    (self.id + 1200).to_s 
  end

  def save_tgz 
    unless File.directory?(self.tmp_dir_name)
      Dir.mkdir(self.tmp_dir_name)
    end
    
    File.open(self.tmp_file_path, "w") do |f|
      f.binmode
      f.write(self.tgz)
    end
  end

  def status
    psout = `ps -ef | grep [r]ails | grep #{self.tmp_port}`
    if (!psout.nil? && psout != "")
      "Running"
    else
      "Stopped"
    end
  end 


  def run_it0
    "Testing! "
  end

  def run_it
    if code.index("system").nil? || true  # should come up with a better solution...
      begin 
        orig_defout = $stdout
        $stdout = StringIO.new
        eval(code)
        $stdout.string
      rescue SyntaxError => se
        "The code contains syntax errors:\n " + ($!).to_s.gsub(/ *\(eval\) */,'')
      rescue Exception => exc
        "Error(s) has occured in during the execution:\n  " + $!
      ensure
        $stdout = orig_defout
      end      
    else
      "Unknown errors(s)."
    end
  end

  def uploaded_file=(file_field)
  end
  
  def code_shown
    code
  end


#  def uploaded_file=(file_field)
#     self.name = File.basename(file_field.original_filename)
#     self.code = file_field.read

#     print "Setting: ", self.name, "!\n"
#     print "Setting: ", self.code, "!\n"
#   end

end
