class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        # Contact.create(name: params[:contact][:name], email: params[:contact][:email], content: params[:contact][:content])
        # Contact.create(params[:contact])
        # Contact.create(params.require(:contact).permit(:name,:email,:content))
        # Contact.create(contact_params)
        @contact = Contact.new(contact_params)
        if @contact.save
            redirect_to blogs_path, notice: "お問い合わせを送信しました！"
        else
            render "new"
        end
        # redirect_to blogs_path
    end
    
    private
    
    def contact_params
        params.require(:contact).permit(:name, :email, :content)
    end
end
