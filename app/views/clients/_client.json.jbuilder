	json.id client.id
	json.full_name client.full_name
	json.first_name client.first_name
	json.last_name client.last_name
	json.email client.email
	json.password client.password
	json.race client.race
	json.sex client.sex
	json.home_phone client.home_phone
	json.work_phone client.work_phone
	json.cell_phone client.cell_phone
	json.address client.address
	json.state client.state
	json.city client.city
	json.zip_code client.zip_code
	json.ward client.ward
	json.zip_code client.zip_code
	json.ssn client.ssn
	json.preferred_contact_method client.preferred_contact_method
	json.preferred_language client.preferred_language
	json.dob client.dob
	json.head_of_household client.head_of_household
	json.num_in_household client.num_in_household
	json.num_of_dependants client.num_of_dependants
	json.education_level client.education_level
	json.disability client.disability
	json.union_member client.union_member
	json.military_service_member client.military_service_member
	json.volunteer_interest client.volunteer_interest
	json.estimated_household_income client.estimated_household_income
	json.authorization_and_waiver client.authorization_and_waiver
	json.privacy_policy_authorization client.privacy_policy_authorization


	json.gross_wages client.budget.gross_wages unless client.budget.blank?
	json.created_at client.budget.created_at unless client.budget.blank?
	json.updated_at client.budget.updated_at unless client.budget.blank?
	json.self_employment_income client.budget.self_employment_income unless client.budget.blank?
	json.overtime client.budget.overtime unless client.budget.blank?
	json.unemployment client.budget.unemployment unless client.budget.blank?
	json.tips_commisions_bonus client.budget.tips_commisions_bonus unless client.budget.blank?
	json.nontaxable_social_security client.budget.nontaxable_social_security unless client.budget.blank?
	json.taxable_social_security client.budget.taxable_social_security unless client.budget.blank?
	json.rental_income client.budget.rental_income unless client.budget.blank?
	json.other_income client.budget.other_income unless client.budget.blank?
	json.primary_checking client.budget.primary_checking unless client.budget.blank?
	json.secondary_checking client.budget.secondary_checking unless client.budget.blank?
	json.savings_money_market client.budget.savings_money_market unless client.budget.blank?
	json.stocks_or_bonds client.budget.stocks_or_bonds unless client.budget.blank?
	json.four_zero_one_k client.budget.four_zero_one_k unless client.budget.blank?
	json.home_equity client.budget.home_equity unless client.budget.blank?
	json.other_property client.budget.other_property unless client.budget.blank?
	json.car client.budget.car unless client.budget.blank?
	json.other_assets client.budget.other_assets unless client.budget.blank?
	json.principal_and_interest client.budget.principal_and_interest unless client.budget.blank?
	json.prop_tax client.budget.prop_tax unless client.budget.blank?
	json.assoc_fees client.budget.assoc_fees unless client.budget.blank?
	json.junior_mortgage client.budget.junior_mortgage unless client.budget.blank?
	json.min_credit_card_payment client.budget.min_credit_card_payment unless client.budget.blank?
	json.car_payment client.budget.car_payment unless client.budget.blank?
	json.student_loan client.budget.student_loan unless client.budget.blank?
	json.gas client.budget.gas unless client.budget.blank?
	json.electricity client.budget.electricity unless client.budget.blank?
	json.water client.budget.water unless client.budget.blank?
	json.phone client.budget.phone unless client.budget.blank?
	json.other_utilities client.budget.other_utilities unless client.budget.blank?
	json.food client.budget.food unless client.budget.blank?
	json.auto_insurance client.budget.auto_insurance unless client.budget.blank?
	json.gas_car_maintenance client.budget.gas_car_maintenance unless client.budget.blank?
	json.child_care client.budget.child_care unless client.budget.blank?
	json.medical_expenses client.budget.medical_expenses unless client.budget.blank?
	json.clothing client.budget.clothing unless client.budget.blank?
	json.rent client.budget.rent unless client.budget.blank?
	json.rental_insurance client.budget.rental_insurance unless client.budget.blank?
	json.total_monthly_debt client.budget.total_monthly_debt unless client.budget.blank?
	json.gross_monthly_income client.budget.gross_monthly_income unless client.budget.blank?
	json.debt_divided_by_income client.budget.debt_divided_by_income unless client.budget.blank?
	json.client_id client.budget.client_id unless client.budget.blank?

	json.originating_lender client.foreclosure.originating_lender unless client.foreclosure.blank?
	json.created_at client.foreclosure.created_at unless client.foreclosure.blank?
	json.updated_at client.foreclosure.updated_at unless client.foreclosure.blank?
	json.original_loan_number client.foreclosure.original_loan_number unless client.foreclosure.blank?
	json.servicer client.foreclosure.servicer unless client.foreclosure.blank?
	json.servicer_loan_number client.foreclosure.servicer_loan_number unless client.foreclosure.blank?
	json.monthly_mortgage_payment client.foreclosure.monthly_mortgage_payment unless client.foreclosure.blank?
	json.loan_term client.foreclosure.loan_term unless client.foreclosure.blank?
	json.origination_date client.foreclosure.origination_date unless client.foreclosure.blank?
	json.been_to_court client.foreclosure.been_to_court unless client.foreclosure.blank?
	json.court_case_number client.foreclosure.court_case_number unless client.foreclosure.blank?
	json.working_with_lawyer client.foreclosure.working_with_lawyer unless client.foreclosure.blank?
	json.working_w_agency client.foreclosure.working_w_agency unless client.foreclosure.blank?
	json.agency client.foreclosure.agency unless client.foreclosure.blank?

	



