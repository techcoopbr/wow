class CreatorMailer < ApplicationMailer

  def confirm(user)
    begin

      @user = user
      mail(to: @user.email, subject: 'CADASTRO APROVADO, ' + @user.name)

      render :status => 200, :json => {:status => true}.to_json, :content_type => 'application/json'
    rescue
      render :status => 404, :json => {:status => false}.to_json, :content_type => 'application/json'
    end
  end
end
