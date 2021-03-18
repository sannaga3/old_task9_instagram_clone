module PicturesHelper
  def confirm_action_picture
    if action_name == 'new' || action_name == 'create' || action_name == 'confirm'
      confirm_pictures_path
    elsif action_name == 'edit' || action_name == 'update'
      confirm_picture_path
    end
  end
  def confirm_id_picture
    unless @picture.id?
      pictures_path
    else
      picture_path
    end
  end
  def confirm_request_picture
    @picture.id ? 'patch' : 'po sst'
  end
end
