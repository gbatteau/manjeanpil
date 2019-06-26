class ContactsController <ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      ContactMailer.contact_email(name, email, body).deliver
       flash[:success] ="Message sent."
       redirect_to new_contact_path 
    else
       flash[:danger] = @contact.errors.full_messages.join(", ")
       redirect_to new_contact_path
    end
  end
  private
    # To collect data from form, we need to use strong parameters
    # and whitelist the form fields
    # Security Feature
    def contact_params
       params.require(:contact).permit(:name, :email, :comments)
    end
end
