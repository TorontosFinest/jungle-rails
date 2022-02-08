require "rails_helper"

RSpec.describe User, type: :model do

    describe 'Validations' do

    it 'creates a user when all fields are entered' do   
        new_user = User.new(first_name: 'John', last_name: 'Doe' , email: 'johndoe@example.com', password: 'password', password_confirmation: 'password')
        expect(new_user).to be_valid
    end

    it 'validates that there is a first name' do 
        @user = User.new 
        @user.first_name = ''
        expect(@user).to be_invalid
        expect(@user.errors.messages[:first_name]).to include("can't be blank")
    end


    it 'validates that there is a last name' do 
        @user = User.new 
        @user.last_name = ''
        expect(@user).to be_invalid
        expect(@user.errors.messages[:last_name]).to include("can't be blank")
    end


    it 'validates that there is an email' do 
        @user = User.new 
        @user.email = ''
        expect(@user).to be_invalid
        expect(@user.errors.messages[:email]).to include("can't be blank")
    end


    it 'validates that there is a password' do 
        @user = User.new 
        @user.password = ''
        expect(@user).to be_invalid
        expect(@user.errors.messages[:password]).to include("can't be blank")
    end


    it 'validates that there is a password confirmation' do 
        @user = User.new 
        @user.password_confirmation = ''
        expect(@user).to be_invalid
        expect(@user.errors.messages[:password_confirmation]).to include("can't be blank")
    end


    it 'expects passwords to match' do  
    new_user = User.new(first_name: 'John', last_name: 'Doe' , email: 'johndoe@example.com', password: 'password', password_confirmation: 'password')
    second_user = User.new(first_name: 'Jane', last_name: 'Doe' , email: 'janedoe@example.com', password: 'passwor', password_confirmation: 'password')
    new_user.save
    second_user.save
    expect(new_user.password).to eq(new_user.password_confirmation)
    expect(second_user.password).to_not eq(second_user.password_confirmation)
    end

    it 'expects passwords to be 4 or more characters' do  
    new_user = User.new(first_name: 'John', last_name: 'Doe' , email: 'johndoe@example.com', password: 'password', password_confirmation: 'password')
    second_user = User.new(first_name: 'Jane', last_name: 'Doe' , email: 'janedoe@example.com', password: 'pas', password_confirmation: 'pas')
    new_user.save
    second_user.save
    expect(new_user).to be_valid
    expect(second_user).to be_invalid
    expect(second_user.errors.messages[:password_confirmation]).to include("is too short (minimum is 4 characters)")
    expect(second_user.errors.messages[:password]).to include("is too short (minimum is 4 characters)")
    end

end

    describe '.authenticate_with_credentials' do 
    
    it 'should successfully authenticate if credentials are correct' do 
    new_user = User.new(first_name: 'John', last_name: 'Doe' , email: 'johndoe@example.com', password: 'password', password_confirmation: 'password')
    new_user.save
    validate = User.authenticate_with_credentials('johndoe@example.com', 'password')
    expect(validate).to eq(new_user)

    end

    it 'should unsuccessfully authenticate if credentials are not correct' do 
    new_user = User.new(first_name: 'John', last_name: 'Doe' , email: 'johndoe@example.com', password: 'password', password_confirmation: 'password')
    new_user.save
    validate = User.authenticate_with_credentials('johndoe@example.com', 'paassword')
    expect(validate).to_not eq(new_user)

    end

      it 'should succesfully authenticate if email is capitalized' do 
    new_user = User.new(first_name: 'John', last_name: 'Doe' , email: 'johndoe@example.com', password: 'password', password_confirmation: 'password')
    new_user.save
    validate = User.authenticate_with_credentials('JOHNDOE@EXAMPLE.COM', 'password')
    expect(validate).to eq(new_user)

    end

      it 'should successfully authenticate if whitespace in email' do 
    new_user = User.new(first_name: 'John', last_name: 'Doe' , email: 'johndoe@example.com', password: 'password', password_confirmation: 'password')
    new_user.save
    validate = User.authenticate_with_credentials(' johndoe@example.com ', 'password')
    expect(validate).to eq(new_user)

    end



    end
end