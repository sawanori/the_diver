class ContactsController < ApplicationController
  def new

    if params[:back]
     @contact = Contact.new(contact_params)
    else
     @contact = Contact.new
    end

  end

  def create
   @contact = Contact.new(contact_params)
   respond_to do |format|
     if @contact.save
       format.html{redirect_to root_path, notice: 'お問い合わせありがとうございました！'}
     end
   end
  end

  def contact_confirm
    @contact = Contact.new(contact_params)
    render :new if @contact.invalid?
  end

  private
  def contact_params
   params.require(:contact).permit(:name, :email, :content)
  end

end
