module CompaniesHelper
    def select_company(f)
        f.collection_select(:id, Company.all, :id, :company_name, :prompt => 'Please select a company')
    end
end
