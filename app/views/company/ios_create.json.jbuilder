json.company do
	json.company_id @company.id
	json.name @company.name

	json.job_id @job.id
	json.job_title @job.job_title
	json.lead_source @job.lead_source
	json.short_summary @job.short_summary
	json.salary @job.salary
	binding.pry
	json.pros JSON.parse(@job.pros.pluck(:pro).first) if @pro
	json.cons JSON.parse(@job.cons.pluck(:con).first) if @con

	json.street1 @address.street1 
	json.street2 @address.street2 
	json.city @address.city 
	json.state @address.state 
	json.zipcode @address.zipcode 
	json.full_address @address.full_address

	json.event_id @event.id
	json.research @event.research
	json.key_findings @event.key_findings
	json.takeaways @event.takeaways
	json.outcome @event.outcome
	json.thankyou_note @event.thankyou_note
	json.follow_up @event.follow_up
	json.referral @event.referral
	json.feedback @event.feedback
	json.business_card @event.business_card
end






















# {
# "company": {
#     "name": "Delta"
#     "job_title": "bag boy",
#     "lead_source": "miffy",
#     "short_summary": "fly around the world and party",
#     "salary": 1231214121248121,
#     "street1": "81300 Eric Port",
#     "street2": "Suite 931",
#     "city": "East Karifurt",
#     "state": "WV",
#     "zipcode": "78348",
#     }   

# "pro": [
#       "this job rocks",
#     ],

# "con": [
#       "",
#     ]
# }


