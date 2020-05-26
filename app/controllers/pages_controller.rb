class PagesController < ApplicationController
  def puzzle
    @first = session.fetch(:first)
    @second = session.fetch(:second)
    @third = session.fetch(:third)

    old_results = session.fetch(:guess_history)

      if old_results == nil
         old_results = Array.new
      end
  
    session.store(:last_first, @first)
    session.store(:last_second, @second)
    session.store(:last_third, @third)
    
    current_result = {
      :first => @first,
      :second => @second,
      :third => @third,
    }

    old_results.push(current_result)

    session.store(:guess_history, old_results)

    @old_results =session.fetch(:guess_history)
    if @old_results == nil
      @old_results = Array.new
    end


    render({ :template => "pages/puzzle.html.erb" })

  end
  
  def write_cookie

    session.store(:first, params.fetch("first_num"))
    session.store(:second, params.fetch("second_num"))
    session.store(:third, params.fetch("third_num"))

 @old_results =session.fetch(:guess_history)
    if @old_results == nil
      @old_results = Array.new
    end

    redirect_to("/")

  end
end
