# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Ponto::Application.initialize!

ENV['JAVA_HOME'] = "/usr/java/jdk1.6.0_33/"
ENV['LD_LIBRARY_PATH'] = "#{ENV['LD_LIBRARY_PATH']}:#{ENV['JAVA_HOME']}/jre/lib/i386:#{ENV['JAVA_HOME']}/jre/lib/i386/client"
