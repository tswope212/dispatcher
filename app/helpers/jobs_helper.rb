module JobsHelper
  
  def completion_tools job
    if job.completion_state == 'Unstarted'
      link_to('Mark: Started', job_path(job, :job => {:actual_start => DateTime.now}), :method => :put)
    elsif job.completion_state == 'In Progress'
      link_to('Mark: Completed', job_path(job, :job => {:actual_end => DateTime.now}), :method => :put) + '<br>'.html_safe +
      link_to('Mark: Unstarted', job_path(job, :job => {:actual_start => :nil}), :method => :put)
    end
  end
end
