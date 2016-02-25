module ApplicationHelper
  def edit_icon
   raw("<span class ='btn btn-info btn-block'><i class='fa fa-pencil fa-1x'></i>&nbsp;Edit").html_safe 
  end
  def delete_icon
  	raw("<span class ='btn btn-danger btn-block'><i class='fa fa-trash'></i> &nbsp;Delete </span>").html_safe
  end
  def show_icon
  	raw("<span class ='btn btn-warning btn-block'><i class='fa fa-eye'></i> &nbsp;View </span>").html_safe
  end
end
