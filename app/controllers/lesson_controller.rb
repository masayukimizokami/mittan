class LessonController < ApplicationController
  def hello
    @masse = "hello実行"
  end

  def good
    @good = "good実行"
  end
end
