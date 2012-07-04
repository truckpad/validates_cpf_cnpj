require 'spec_helper'

describe ValidatesCpfCnpj do
  describe 'validates_cpf' do
    it 'should raise an ArgumentError when no attribute is informed' do
      person = Person.new
      lambda { person.validates_cpf }.should raise_exception(ArgumentError, 'You need to supply at least one attribute')
    end

    context 'should be invalid when' do
      it 'value is 1234567890' do
        person = Person.new(:code => '1234567890')
        person.validates_cpf(:code)
        person.errors.should_not be_empty
      end

      it 'value is 12345678901' do
        person = Person.new(:code => '12345678901')
        person.validates_cpf(:code)
        person.errors.should_not be_empty
      end

      it 'value is ABC80033787883' do
        person = Person.new(:code => 'ABC45678901')
        person.validates_cpf(:code)
        person.errors.should_not be_empty
      end

      it 'value is 123.456.789-01' do
        person = Person.new(:code => '123.456.789-01')
        person.validates_cpf(:code)
        person.errors.should_not be_empty
      end

      it 'value is 800337.878-83' do
        person = Person.new(:code => '800337.878-83')
        person.validates_cpf(:code)
        person.errors.should_not be_empty
      end

      it 'value is 800337878-83' do
        person = Person.new(:code => '800337878-83')
        person.validates_cpf(:code)
        person.errors.should_not be_empty
      end

      it 'value is nil' do
        person = Person.new(:code => nil)
        person.validates_cpf(:code)
        person.errors.should_not be_empty
      end

      it 'value is empty' do
        person = Person.new(:code => '')
        person.validates_cpf(:code)
        person.errors.should_not be_empty
      end
    end

    context 'should be valid when' do
      it 'value is 80033787883' do
        person = Person.new(:code => '80033787883')
        person.validates_cpf(:code)
        person.errors.should be_empty
      end

      it 'value is 800.337.878-83' do
        person = Person.new(:code => '800.337.878-83')
        person.validates_cpf(:code)
        person.errors.should be_empty
      end

      it 'value is nil and :allow_nil or :allow_blank is true' do
        person = Person.new(:code => nil)
        person.validates_cpf(:code, :allow_nil => true)
        person.errors.should be_empty
        person.validates_cpf(:code, :allow_blank => true)
        person.errors.should be_empty
      end

      it 'value is empty and :allow_blank is true' do
        person = Person.new(:code => '')
        person.validates_cpf(:code, :allow_blank => true)
        person.errors.should be_empty
        person.validates_cpf(:code, :allow_nil => true)
        person.errors.should_not be_empty
      end

      it ':if option evaluates false' do
        person = Person.new(:code => '12345678901')
        person.validates_cpf(:code, :if => false)
        person.errors.should be_empty
      end

      it ':unless option evaluates true' do
        person = Person.new(:code => '12345678901')
        person.validates_cpf(:code, :unless => true)
        person.errors.should be_empty
      end

      it ':on option is :create and the model instance is not a new record' do
        person = Person.new(:code => '12345678901')
        person.stub!(:new_record?, false)
        person.validates_cpf(:code, :on => :create)
        person.errors.should be_empty
      end

      it ':on option is :update and the model instance is a new record' do
        person = Person.new(:code => '12345678901')
        person.validates_cpf(:code, :on => :update)
        person.errors.should be_empty
      end
    end
  end

  describe 'validates_cnpj' do
    it 'should raise an ArgumentError when no attribute is informed' do
      person = Person.new
      lambda { person.validates_cnpj }.should raise_exception(ArgumentError, 'You need to supply at least one attribute')
    end

    context 'should be invalid when' do
      it 'value is 1234567890123' do
        person = Person.new(:code => '1234567890123')
        person.validates_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is 12345678901234' do
        person = Person.new(:code => '12345678901234')
        person.validates_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is 123456789012345' do
        person = Person.new(:code => '123456789012345')
        person.validates_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is ABC05393625000184' do
        person = Person.new(:code => 'ABC05393625000184')
        person.validates_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is 12.345.678/9012-34' do
        person = Person.new(:code => '12.345.678/9012-34')
        person.validates_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is 05393.625/0001-84' do
        person = Person.new(:code => '05393.625/0001-84')
        person.validates_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is 05393.6250001-84' do
        person = Person.new(:code => '05393.6250001-84')
        person.validates_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is nil' do
        person = Person.new(:code => nil)
        person.validates_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is empty' do
        person = Person.new(:code => '')
        person.validates_cnpj(:code)
        person.errors.should_not be_empty
      end
    end

    context 'should be valid when' do
      it 'value is 05393625000184' do
        person = Person.new(:code => '05393625000184')
        person.validates_cnpj(:code)
        person.errors.should be_empty
      end

      it 'value is 05.393.625/0001-84' do
        person = Person.new(:code => '05.393.625/0001-84')
        person.validates_cnpj(:code)
        person.errors.should be_empty
      end

      it 'value is nil and :allow_nil or :allow_blank is true' do
        person = Person.new(:code => nil)
        person.validates_cnpj(:code, :allow_nil => true)
        person.errors.should be_empty
        person.validates_cnpj(:code, :allow_blank => true)
        person.errors.should be_empty
      end

      it 'value is empty and :allow_blank is true' do
        person = Person.new(:code => '')
        person.validates_cnpj(:code, :allow_blank => true)
        person.errors.should be_empty
        person.validates_cnpj(:code, :allow_nil => true)
        person.errors.should_not be_empty
      end

      it ':if option evaluates false' do
        person = Person.new(:code => '12345678901234')
        person.validates_cnpj(:code, :if => false)
        person.errors.should be_empty
      end

      it ':unless option evaluates true' do
        person = Person.new(:code => '12345678901234')
        person.validates_cnpj(:code, :unless => true)
        person.errors.should be_empty
      end

      it ':on option is :create and the model instance is not a new record' do
        person = Person.new(:code => '12345678901')
        person.stub!(:new_record?, false)
        person.validates_cnpj(:code, :on => :create)
        person.errors.should be_empty
      end

      it ':on option is :update and the model instance is a new record' do
        person = Person.new(:code => '12345678901')
        person.validates_cnpj(:code, :on => :update)
        person.errors.should be_empty
      end
    end
  end

  describe 'validates_cpf_or_cnpj' do
    it 'should raise an ArgumentError when no attribute is informed' do
      person = Person.new
      lambda { person.validates_cpf_or_cnpj }.should raise_exception(ArgumentError, 'You need to supply at least one attribute')
    end

    context 'should be invalid when' do
      it 'value is 1234567890' do
        person = Person.new(:code => '1234567890')
        person.validates_cpf_or_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is 12345678901' do
        person = Person.new(:code => '12345678901')
        person.validates_cpf_or_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is ABC80033787883' do
        person = Person.new(:code => 'ABC45678901')
        person.validates_cpf_or_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is 123.456.789-01' do
        person = Person.new(:code => '123.456.789-01')
        person.validates_cpf_or_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is 800337.878-83' do
        person = Person.new(:code => '800337.878-83')
        person.validates_cpf_or_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is 800337878-83' do
        person = Person.new(:code => '800337878-83')
        person.validates_cpf_or_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is nil' do
        person = Person.new(:code => nil)
        person.validates_cpf_or_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is empty' do
        person = Person.new(:code => '')
        person.validates_cpf_or_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is 1234567890123' do
        person = Person.new(:code => '1234567890123')
        person.validates_cpf_or_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is 12345678901234' do
        person = Person.new(:code => '12345678901234')
        person.validates_cpf_or_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is 123456789012345' do
        person = Person.new(:code => '123456789012345')
        person.validates_cpf_or_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is ABC05393625000184' do
        person = Person.new(:code => 'ABC05393625000184')
        person.validates_cpf_or_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is 12.345.678/9012-34' do
        person = Person.new(:code => '12.345.678/9012-34')
        person.validates_cpf_or_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is 05393.625/0001-84' do
        person = Person.new(:code => '05393.625/0001-84')
        person.validates_cpf_or_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is 05393.6250001-84' do
        person = Person.new(:code => '05393.6250001-84')
        person.validates_cpf_or_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is nil' do
        person = Person.new(:code => nil)
        person.validates_cpf_or_cnpj(:code)
        person.errors.should_not be_empty
      end

      it 'value is empty' do
        person = Person.new(:code => '')
        person.validates_cpf_or_cnpj(:code)
        person.errors.should_not be_empty
      end
    end

    context 'should be valid when' do
      it 'value is 80033787883' do
        person = Person.new(:code => '80033787883')
        person.validates_cpf_or_cnpj(:code)
        person.errors.should be_empty
      end

      it 'value is 800.337.878-83' do
        person = Person.new(:code => '800.337.878-83')
        person.validates_cpf_or_cnpj(:code)
        person.errors.should be_empty
      end

      it 'value is nil and :allow_nil or :allow_blank is true' do
        person = Person.new(:code => nil)
        person.validates_cpf_or_cnpj(:code, :allow_nil => true)
        person.errors.should be_empty
        person.validates_cpf_or_cnpj(:code, :allow_blank => true)
        person.errors.should be_empty
      end

      it 'value is empty and :allow_blank is true' do
        person = Person.new(:code => '')
        person.validates_cpf_or_cnpj(:code, :allow_blank => true)
        person.errors.should be_empty
        person.validates_cpf_or_cnpj(:code, :allow_nil => true)
        person.errors.should_not be_empty
      end

      it ':if option evaluates false' do
        person = Person.new(:code => '12345678901')
        person.validates_cpf_or_cnpj(:code, :if => false)
        person.errors.should be_empty
      end

      it ':unless option evaluates true' do
        person = Person.new(:code => '12345678901')
        person.validates_cpf_or_cnpj(:code, :unless => true)
        person.errors.should be_empty
      end

      it ':on option is :create and the model instance is not a new record' do
        person = Person.new(:code => '12345678901')
        person.stub!(:new_record?, false)
        person.validates_cpf_or_cnpj(:code, :on => :create)
        person.errors.should be_empty
      end

      it ':on option is :update and the model instance is a new record' do
        person = Person.new(:code => '12345678901')
        person.validates_cpf_or_cnpj(:code, :on => :update)
        person.errors.should be_empty
      end

      it 'value is 05393625000184' do
        person = Person.new(:code => '05393625000184')
        person.validates_cpf_or_cnpj(:code)
        person.errors.should be_empty
      end

      it 'value is 05.393.625/0001-84' do
        person = Person.new(:code => '05.393.625/0001-84')
        person.validates_cpf_or_cnpj(:code)
        person.errors.should be_empty
      end

      it 'value is nil and :allow_nil or :allow_blank is true' do
        person = Person.new(:code => nil)
        person.validates_cpf_or_cnpj(:code, :allow_nil => true)
        person.errors.should be_empty
        person.validates_cpf_or_cnpj(:code, :allow_blank => true)
        person.errors.should be_empty
      end

      it 'value is empty and :allow_blank is true' do
        person = Person.new(:code => '')
        person.validates_cpf_or_cnpj(:code, :allow_blank => true)
        person.errors.should be_empty
        person.validates_cpf_or_cnpj(:code, :allow_nil => true)
        person.errors.should_not be_empty
      end

      it ':if option evaluates false' do
        person = Person.new(:code => '12345678901234')
        person.validates_cpf_or_cnpj(:code, :if => false)
        person.errors.should be_empty
      end

      it ':unless option evaluates true' do
        person = Person.new(:code => '12345678901234')
        person.validates_cpf_or_cnpj(:code, :unless => true)
        person.errors.should be_empty
      end

      it ':on option is :create and the model instance is not a new record' do
        person = Person.new(:code => '12345678901')
        person.stub!(:new_record?, false)
        person.validates_cpf_or_cnpj(:code, :on => :create)
        person.errors.should be_empty
      end

      it ':on option is :update and the model instance is a new record' do
        person = Person.new(:code => '12345678901')
        person.validates_cpf_or_cnpj(:code, :on => :update)
        person.errors.should be_empty
      end
    end
  end
end