class IpcTestController < ApplicationController
  skip_authorization_check

  def index
    @command = "java -jar \"#{Rails.root}/ext/TMCipcTest.jar\" These are arguments given at the start..."
    child = POSIX::Spawn::Child.new(@command, :input => 'And this is input passed to the child')
    @output = child.out
    @errors = child.err
    @status = child.status
  end
end