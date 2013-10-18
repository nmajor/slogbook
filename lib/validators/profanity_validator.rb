class ProfanityValidator < ActiveModel::Validator
  def validate(record)
    if options[:fields].any?{ |field| ProfanityFilter::Base.profane?(record.send(field)) } 
      record.errors[:base] << "^You have one or more bad words in your field(s)"
    end
  end
end