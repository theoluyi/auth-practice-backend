# This whole file down thru login looks fine compared to Eric at 40:12
# all 3 of these actions should render an idential response (render statement)
# so have one function to handle all of these responses i.e., handleResponse 
class UsersController < ApplicationController
    before_action :authorized, only: [:persist]

    def persist
        byebug
        codeword = encode_token({user_id: @user.id})
        render json: { user: UserSerializer.new(@user), token: codeword}
    end 

    def create
        @user = User.create(user_params)

        if @user.valid?
            codeword = encode_token({user_id: @user.id})
            # render json: @user, status: 201
            render json: { user: UserSerializer.new(@user), token: codeword }, status: 201
        else 
            render json: {error: "nice try bub"}, status: 401
        end 
        # when someone makes a request to create a user
        # i'm going to send out this  json object
        # (AS THE RESPONSE I THINK!? OMG I'M GONNA TEST THAT)
        # WHY DOES ENGLISH HAVE SO MANY ARCHAIC WORDS LIKE RENDER!??
    end

    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            codeword = encode_token({user_id: @user.id})
            # render json: @user
            render json: { user: UserSerializer.new(@user), token: codeword }
        else 
            render json: {error: "Nice job dbag"}, status: 401
        end
    end


    private

    def user_params
        params.permit(:username, :password)
        # remember, everywhere except migrations
        # write password, not pw_digest
        # I was just confused about this
        # thinking if in db the column is pw_digest
        # how does it know???? obscured rails methods im sure
        
        # ok Eric just said: has_secure_password links 
        # password and password_digest
        # this is why you MUST omit .require here
        # https://youtu.be/EPqmdyxOwKA?t=2280
    end
end