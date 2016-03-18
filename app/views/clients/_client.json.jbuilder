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

	json.client_id client.homebuying.client_id unless client.homebuying.blank?
	json.lender client.homebuying.lender unless client.homebuying.blank?
	json.hear_of_workshop client.homebuying.hear_of_workshop unless client.homebuying.blank?
	json.contact_for_appointment client.homebuying.contact_for_appointment unless client.homebuying.blank?
	json.real_estate_contract client.homebuying.real_estate_contract unless client.homebuying.blank?
	json.realtor_name client.homebuying.realtor_name unless client.homebuying.blank?
	json.realtor_phone client.homebuying.realtor_phone unless client.homebuying.blank?
	json.property_address client.homebuying.property_address unless client.homebuying.blank?
	json.property_state client.homebuying.property_state unless client.homebuying.blank?
	json.property_city client.homebuying.property_city unless client.homebuying.blank?
	json.loan_officer_name client.homebuying.loan_officer_name unless client.homebuying.blank?
	json.loan_officer_email client.homebuying.loan_officer_email unless client.homebuying.blank?
	json.loan_officer_phone client.homebuying.loan_officer_phone unless client.homebuying.blank?
	json.payment_assistance_program client.homebuying.payment_assistance_program unless client.homebuying.blank?
	json.approx_closing_date client.homebuying.approx_closing_date unless client.homebuying.blank?

	json.violation_type client.law_project.violation_type unless client.law_project.blank?
	json.client_id client.law_project.client_id unless client.law_project.blank?
	json.current_evicted client.law_project.current_evicted unless client.law_project.blank?
	json.community_group client.law_project.community_group unless client.law_project.blank?
	json.tech_assistance client.law_project.tech_assistance unless client.law_project.blank?
	json.frclsr_prevention client.law_project.frclsr_prevention unless client.law_project.blank?
	json.low_income_family client.law_project.low_income_family unless client.law_project.blank?
	json.displacement client.law_project.displacement unless client.law_project.blank?
	json.substandard_housing client.law_project.substandard_housing unless client.law_project.blank?
	json.disabilities client.law_project.disabilities unless client.law_project.blank?
	json.lucha_tenant client.law_project.lucha_tenant unless client.law_project.blank?
	json.law_project_chargable client.law_project.law_project_chargable unless client.law_project.blank?
	json.other client.law_project.other unless client.law_project.blank?
	json.census_tract client.law_project.census_tract unless client.law_project.blank?


	json.evictions client.rental.evictions unless client.rental.blank?
	json.client_id client.rental.client_id unless client.rental.blank?
	json.waitlist_num client.rental.waitlist_num unless client.rental.blank?
	json.studio client.rental.studio unless client.rental.blank?
	json.two_bed client.rental.two_bed unless client.rental.blank?
	json.three_bed client.rental.three_bed unless client.rental.blank?
	json.wheelchair_accessible client.rental.wheelchair_accessible unless client.rental.blank?
	json.car_owner client.rental.car_owner unless client.rental.blank?
	json.pet_owner client.rental.pet_owner unless client.rental.blank?
	json.kind_of_pet client.rental.kind_of_pet unless client.rental.blank?
	json.hear_of_property client.rental.hear_of_property unless client.rental.blank?
	json.reasons_for_application client.rental.reasons_for_application unless client.rental.blank?
	json.landlord_name client.rental.landlord_name unless client.rental.blank?
	json.landlord_address client.rental.landlord_address unless client.rental.blank?
	json.landlord_phone client.rental.landlord_phone unless client.rental.blank?
	json.occupancy_at_apartment client.rental.occupancy_at_apartment unless client.rental.blank?
	json.monthly_rent client.rental.monthly_rent unless client.rental.blank?
	json.fuel_electric client.rental.fuel_electric unless client.rental.blank?
	json.pre_landlord_name client.rental.pre_landlord_name unless client.rental.blank?
	json.pre_landlord_address client.rental.pre_landlord_address unless client.rental.blank?
	json.pre_landlord_phone client.rental.pre_landlord_phone unless client.rental.blank?
	json.pre_rent client.rental.pre_rent unless client.rental.blank?
	json.pre_fuel_electric client.rental.pre_fuel_electric unless client.rental.blank?
	json.reason_for_move client.rental.reason_for_move unless client.rental.blank?
	json.housing_situation client.rental.housing_situation unless client.rental.blank?
	json.employer_name client.rental.employer_name unless client.rental.blank?
	json.employer_address client.rental.employer_address unless client.rental.blank?
	json.employer_city client.rental.employer_city unless client.rental.blank?
	json.employer_state client.rental.employer_state unless client.rental.blank?
	json.employer_phone client.rental.employer_phone unless client.rental.blank?
	json.position client.rental.position unless client.rental.blank?
	json.length_employed client.rental.length_employed unless client.rental.blank?
	json.personal_reference_name client.rental.personal_reference_name unless client.rental.blank?
	json.per_ref_address client.rental.per_ref_address unless client.rental.blank?
	json.per_ref_street client.rental.per_ref_street unless client.rental.blank?
	json.per_ref_state client.rental.per_ref_state unless client.rental.blank?
	json.per_ref_phone client.rental.per_ref_phone unless client.rental.blank?
	json.per_ref_relationship client.rental.per_ref_relationship unless client.rental.blank?
	json.displaced client.rental.displaced unless client.rental.blank?
	json.homeless client.rental.homeless unless client.rental.blank?
	json.over_fifty_percent client.rental.over_fifty_percent unless client.rental.blank?
	json.agree_to_fee client.rental.agree_to_fee unless client.rental.blank?



