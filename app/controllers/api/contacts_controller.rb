module Api
    class ContactsController < ApplicationController
        def index
            @contacts = Contact.all
            render json: @contacts
        end

        def show
            @contact = Contact.find(params[:id])
            render json: @contact
        end

        def contact_params
            params.require(:contact).permit(:name, :phone)
        end

        def create
            @contact = Contact.new(contact_params)

            if @contact.save
                render json: @contact
            else
                render json: @contact.errors, status: :unprocessable_entity
            end
        end

        def update
            @contact = Contact.find(params[:id])

            if @contact.update(contact_params)
                render json: @contact
            else
                render json: @contact.errors, status: :unprocessable_entity
            end
        end

        def destroy
            @contact = Contact.find(params[:id])

            if @contact.present?
                @contact.destroy
                render json: @contact
            else
                render json: { error: 'Contact not found' }
            end
        end
    end
end
