UserError.configure do
  rescue_from 'Dummy::Exception', :with => :forbidden
end
